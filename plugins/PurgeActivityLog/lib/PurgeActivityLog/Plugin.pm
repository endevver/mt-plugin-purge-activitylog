# Copyright (C) 2010 Endevver, LLC.

package PurgeActivityLog::Plugin;

use strict;
use warnings;

use Carp qw( croak longmess confess );
use MT::Util qw( relative_date    offset_time format_ts days_in 
                 offset_time_list epoch2ts    ts2epoch  trim );

sub load_tasks {
    my $cfg = MT->config;
    return {
        'PurgeLog' => {
            'label' => 'Purge Old Activity Log Entries',
            'frequency' => 1,#(60 * 60 * 24),
            'code' => sub { 
                PurgeActivityLog::Plugin->task_purge; 
            },
            
        }
    };
}

sub task_purge {
    my $this = shift;
    my $mt     = MT->instance;
    my $plugin = MT->component('PurgeActivityLog');
    my $n      = $plugin->get_config_value('purge_n_days','system');
    my $total_changed = 0;
    $n = 5;
    my $epoch  = time() - (60 * 60 * 24 * $n);

    require MT::Util;
    my $blog_iter = MT->model('blog')->load_iter();
    while (my $blog = $blog_iter->()) {
        my $now    = epoch2ts($blog,time());
        my $date   = epoch2ts($blog,$epoch);
        my $iter = MT->model('log')->load_iter( { created_on => [ undef, $date ], blog_id => $blog->id },
                                                { range => { created_on => 1 } } );
        print "Purging activity log for blog: " . $blog->name . " older than $n days.\n";
        while ( my $log = $iter->() ) {
            $log->remove();
            $total_changed++;
        }
    }
    print "Purging system activity log...\n";
    my $now    = epoch2ts(undef,time());
    my $date   = epoch2ts(undef,$epoch);
    print "Purging activity log entries older than $n days.\n";
    my $iter = MT->model('log')->load_iter( { created_on => [ undef, $date ], blog_id => 0 },
                                            { range => { created_on => 1 } } );
    while ( my $log = $iter->() ) {
        $log->remove();
        $total_changed++;
    }
    print "Deleted $total_changed log entries.\n";
    $total_changed > 0 ? 1 : 0;
}

1;

__END__
