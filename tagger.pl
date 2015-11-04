#!/usr/bin/perl
#
# tagger.pl
# Updates required tag files in tags directory

use strict;
use warnings;

# Step 1 Get list of markdown files
my $mdfiles = list_markdown_files();

# Step 2 Generate tags from markdown files
my $cats = generate_cats_from_markdown_files( $mdfiles );

# Step 2 Generate tags from markdown files
my $tags = generate_tags_from_markdown_files( $mdfiles );

# Step 3 Remove existing tag files
delete_files_of('category');
delete_files_of('tag');

# Step 4 Create tag files from tags
create_files_of('category', $cats);
create_files_of('tag', $tags);

exit;

sub delete_files_of {
    my $type = shift;

    use File::Find::Rule;
    my $rule = File::Find::Rule->new;
    $rule->file;
    $rule->name( '*.markdown', '*.md' );
    my @tagfiles = $rule->in( $type );

    foreach my $tagfile (@tagfiles) {
        print "Deleted $tagfile\n";
        unlink($tagfile) or die "Cannot unlink $tagfile: $!";
    }
}

sub list_markdown_files {
    use File::Find::Rule;
    my $rule = File::Find::Rule->new;
    $rule->or(
        $rule->new
        ->directory
        ->name('tag', 'category')
        ->prune
        ->discard,
        $rule->new
    );
    $rule->file;
    $rule->name( '*.markdown', '*.md' );
    my @mdfiles = $rule->in( '.' );
    return \@mdfiles;
}

sub generate_cats_from_markdown_files {
    my $mdfiles = shift;

    my %cats;
    foreach my $mdfile (@{ $mdfiles }) {
        my $catline  = find_cat_line_in_markdown_file( $mdfile );
        $cats{$catline}=1;
    }

    my @cats = sort keys %cats;
    return \@cats;
}

sub generate_tags_from_markdown_files {
    my $mdfiles = shift;

    my %tags;
    foreach my $mdfile (@{ $mdfiles }) {
        my $tagline  = find_tag_line_in_markdown_file( $mdfile );
        my @temptags = split(/\,\s*/, $tagline);

        foreach my $temptag (@temptags) {
            $tags{$temptag}=1;
        }
    }

    my @tags = sort keys %tags;
    return \@tags;
}

sub find_cat_line_in_markdown_file {
    my $mdfile = shift;

    my $catline;
    open( my $fh_mdfile, '<', $mdfile ) or die "Cannot read $mdfile: $!";
    while (my $line = <$fh_mdfile>) {
        if ($line =~ /^category:\s*(\S*)\s*$/) {
            $catline = $1;
            last;
        }
    }
    close( $fh_mdfile ) or die "Cannot close $mdfile: $!";

    return $catline;
}

sub find_tag_line_in_markdown_file {
    my $mdfile = shift;

    my $tagline;
    open( my $fh_mdfile, '<', $mdfile ) or die "Cannot read $mdfile: $!";
    while (my $line = <$fh_mdfile>) {
        if ($line =~ /^tags: \[(.*)\]/) {
            $tagline = $1;
            last;
        }
    }
    close( $fh_mdfile ) or die "Cannot close $mdfile: $!";

    return $tagline;
}

sub create_files_of {
    my ($type, $tags) = @_;

    foreach my $tag (@{ $tags }) {
        create_file_of($type, $tag);
    }

    return;
}

sub create_file_of {
    my ($type, $tag) = @_;

    my $tagfilename = "./$type/$tag.md";

    print "Writing $tag file to $tagfilename\n";

    my $tagtext = <<END;
---
layout: by_$type
$type: $tag
permalink: /$type/$tag/
---
END

    open(my $fh_tagfile, ">", $tagfilename) or die "Cannot create $tagfilename: $!";
    print $fh_tagfile $tagtext;
    close($fh_tagfile) or die "Cannot close $tagfilename: $!";

    return;
}

