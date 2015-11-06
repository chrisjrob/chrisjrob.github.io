#!/usr/bin/perl
#
# bp2md.pl
# Convert Bootpolish to Markdown format

use strict;
use warnings;
use File::Slurp;

# Step 1 Get list of markdown files
my $mdfiles = list_markdown_files();

convert_files($mdfiles);

exit;

sub convert_file {
    my $file = shift;

    my $infile = $file;
    my $intext = read_file( $infile );

    my $outtext = $intext;

    # Remove boxes
    $outtext =~ s/[<>]{3}\-{3,}\s*\n//gms;

    # Remove TOC
    $outtext =~ s/%TOC%\s*?\n//gms;

    # Remove RAW
    $outtext =~ s/%RAW%\s*?\n//gms;

    # Remove PRE formatting
    $outtext =~ s/^\<\/?pre\>\s*?\n//gms;

    # Indent $
    $outtext =~ s/^[\$]/    \$/gms;

    # Remove exclamations and questions
    $outtext =~ s/^\<[!?]\>\s?(.*?)$/**$1**/gms;

    # Grab title
    $outtext =~ s/^\#+\s*(.*?)\n+//ms;
    my $title = $1;

    # Remove double blank lines
    $outtext =~ s/\n{3,}/\n\n/gms;

    # Reduce headers
    $outtext =~ s/\#{3}/##/gms;

    my $header =<<END;
---
layout: page
title: Howto | $title
menu: howto
weight: 40
category: technology
tags: [linux]
---

END

    my $outfile = "$infile.test";
    write_file( $outfile, $header . $outtext );
}

sub convert_files {
    my $mdfiles = shift;

    foreach my $file (@{$mdfiles}) {
        convert_file($file);
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

