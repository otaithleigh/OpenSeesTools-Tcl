namespace eval ::Logger {
    namespace export Logger
    array set LOGLEVELS [list DEBUG 0 INFO 10 WARNING 20 ERROR 30 FATAL 40]
}

proc ::Logger::checkLogLevel {logLevel} {
    if {[lsearch -exact [array names ::Logger::LOGLEVELS] $logLevel] >= 0} {
        return
    } else {
        error "invalid log level: $logLevel"
    }
}

oo::class create ::Logger::Logger {
    variable Name
    variable LogLevel
    method setLogLevel {logLevel} {
        ::Logger::checkLogLevel $logLevel
        set LogLevel $logLevel
    }

    constructor {logName {logLevel WARNING}} {
        set Name $logName
        ::Logger::checkLogLevel $logLevel
        set LogLevel $logLevel
    }

    method debug {msg} {
        if {$::Logger::LOGLEVELS($LogLevel) <= $::Logger::LOGLEVELS(DEBUG)} {
            puts stderr "\[$Name\] DEBUG: $msg"
        }
    }
    method info {msg} {
        if {$::Logger::LOGLEVELS($LogLevel) <= $::Logger::LOGLEVELS(INFO)} {
            puts stderr "\[$Name\] INFO: $msg"
        }
    }
    method warning {msg} {
        if {$::Logger::LOGLEVELS($LogLevel) <= $::Logger::LOGLEVELS(WARNING)} {
            puts stderr "\[$Name\] WARNING: $msg"
        }
    }
    method error {msg} {
        if {$::Logger::LOGLEVELS($LogLevel) <= $::Logger::LOGLEVELS(ERROR)} {
            puts stderr "\[$Name\] ERROR: $msg"
        }
    }
    method fatal {msg} {
        if {$::Logger::LOGLEVELS($LogLevel) <= $::Logger::LOGLEVELS(FATAL)} {
            puts stderr "\[$Name\] FATAL: $msg"
        }
    }
}

package provide Logger 1.0
package require Tcl 8.6
