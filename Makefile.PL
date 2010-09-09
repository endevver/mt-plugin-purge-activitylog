use ExtUtils::MakeMaker;

use YAML::Any qw(LoadFile);
my $file = "plugins/PurgeActivityLog/config.yaml";
my $version = LoadFile($file)->{version} ||
    die "No version found in $file";

WriteMakefile(
    NAME            => 'Purge Activity Log',
    VERSION         => $version,
    DISTNAME        => 'PurgeActivityLog',
);
