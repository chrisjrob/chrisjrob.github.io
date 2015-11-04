#!/usr/bin/perl
#
# tagger.pl
# Updates required tag files in tags directory

use strict;
use warnings;

# Step 1 Get list of markdown files
my $mdfiles = list_markdown_files();

# Step 2 Generate tags from markdown files

my $tags = generate_tags_from_markdown_files( $mdfiles );

# Step 3 Remove existing tag files

# Step 4 Create tag files from tags

foreach my $tag (@{ $tags }) {
    print $tag, "\n";
}

exit;

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
