
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Critique a database schema for best practices",
  "AUTHOR" => "Mark Gardner <mjgardner\@cpan.org>",
  "BUILD_REQUIRES" => {
    "DBICx::TestDatabase" => 0,
    "DBIx::Class::Core" => 0,
    "DBIx::Class::Schema" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Path::Class" => 0,
    "Test::More" => "0.94",
    "Test::Most" => 0,
    "Test::Script::Run" => 0,
    "base" => 0,
    "local::lib" => 0,
    "perl" => "5.006",
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-DBCritic",
  "EXE_FILES" => [
    "bin/dbcritic"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::DBCritic",
  "PREREQ_PM" => {
    "Algorithm::Combinatorics" => 0,
    "Carp" => 0,
    "Const::Fast" => 0,
    "DBI" => 0,
    "DBIx::Class" => "0.08125",
    "DBIx::Class::Schema::Loader" => "0.07007",
    "Data::Compare" => 0,
    "Devel::Symdump" => 0,
    "English" => 0,
    "Getopt::Long::Descriptive" => 0,
    "List::MoreUtils" => 0,
    "Modern::Perl" => 0,
    "Module::Pluggable" => 0,
    "Moo" => 0,
    "Moo::Role" => 0,
    "Scalar::Util" => 0,
    "Sub::Quote" => 0,
    "namespace::autoclean" => 0,
    "overload" => 0,
    "strict" => 0,
    "utf8" => 0
  },
  "VERSION" => "0.021",
  "test" => {
    "TESTS" => "t/*.t t/policy/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



