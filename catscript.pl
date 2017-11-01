#!/usr/bin/perl
print "What is the path of the drive?";
$drive = <>;
$cats = "~/Documents/CatDrive";

use File::Copy qw(copy);
copy love.png, $drive+"##VIEW_ME##.png";