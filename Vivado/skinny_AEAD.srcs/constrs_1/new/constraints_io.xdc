create_clock -period 20.000 -name clk -waveform {0.000 10.000} -add [get_ports clock]
set_property SEVERITY {Advisory} [get_drc_checks NSTD-1]
set_property SEVERITY {Advisory} [get_drc_checks UCIO-1]
set_property IS_ENABLED false [get_drc_checks NSTD-1]
set_property IS_ENABLED false [get_drc_checks UCIO-1]