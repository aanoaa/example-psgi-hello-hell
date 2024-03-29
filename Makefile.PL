use strict;
use warnings;
use ExtUtils::MakeMaker 6.30;

my %WriteMakefileArgs = (
    "ABSTRACT"           => "Korea Perl Workshop 2012",
    "AUTHOR"             => "keedi Kim <keedi\@perl.kr>",
    "BUILD_REQUIRES"     => { "Test::More" => 0 },
    "CONFIGURE_REQUIRES" => { "ExtUtils::MakeMaker" => "6.30" },
    "DISTNAME"           => "KPW2012",
    "LICENSE"            => "perl",
    "NAME"               => "KPW2012",
    "PREREQ_PM"          => {
        "App::cpanminus" => 0,
    },
    "VERSION" => "0.0.1",
    "test"    => { "TESTS" => "t/*.t" }
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
