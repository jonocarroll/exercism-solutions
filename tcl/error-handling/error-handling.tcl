proc custom_error_message {message} {
    error "This is an error"
}

proc handle_error {script} {
    try {
        uplevel $script
    } trap {ARITH DIVZERO} {} {
        return "division by zero"
    } trap {POSIX ENOENT} {} {
        return "file does not exist"
    } trap {TCL LOOKUP COMMAND} {} {
        return "proc does not exist"
    } on ok {} {
        return "success"
    }
}
