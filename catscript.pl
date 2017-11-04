#!/usr/bin/perl
print "What is the path of the drive?";
$drive = <>;
$cats = "~/Documents/CatDrive";

use File::Copy qw(copy);
copy love.png, $drive+"##VIEW_ME##.png";

use Search::Google::Images;
#from https://metacpan.org/pod/release/EJS/Search-Google-1.0.0/lib/Search/Google.pm
#documentation sucks though

#API key for custom Google Search 

# you should provide a valid http referer address according
# to Google AJAX Search API terms of use!
Search::Google::Web->http_referer('http://hunterline.info');
 
my $search = Search::Google::Web->new(
        v => '1.0',
        q => 'cat meme',
);
 
die "response status failure" if $search->status != 200;
 
my $data = $search->data;
 
my $cursor = $data->cursor;
 
printf "pages: %s\n", $cursor->pages;
printf "current page index: %s\n", $cursor->currentPageIndex;
printf "estimated result count: %s\n", $cursor->estimatedResultCount;
 
my @results = $data->results;
 
foreach my $r (@results) {
        printf "\n";
        printf "title: %s\n", $r->title;
        printf "url: %s\n", $r->url;
}