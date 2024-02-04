#-----------------------------------------------------------------------------
#
# File name:    srio_gen2_0.xdc
# Rev:          4.0
# Description:  This module constrains the example design
#
#-----------------------------------------------------------------------------
######################################
#         Core Time Specs            #
######################################

create_clock -period 8 -name sys_clkp -waveform {0 4} [get_ports sys_clkp]
set_case_analysis 0 [list [get_pins -hierarchical *mode_1x]]

set_false_path -to [get_cells -hierarchical -filter {NAME =~ *srio_rst*inst*/*reg[0]}]

#set_multicycle_path -from [get_pins *cfg_raddr_reg* -hierarchical] -to [get_pins *cfg_reg*rdata_reg* -hierarchical] 3
#set_multicycle_path -from [get_pins *cfg_raddr_reg* -hierarchical] -to [get_pins *cfg_reg*rdata_reg* -hierarchical] 2 -hold
################################################################################

######################################################
##       GT and other Pin Locations                  #
## NOTE: These pins need to be updated for device:   #
## "xc7z012sclg485-2"#
## Below LOC's are given as dummy LOC's and          #
## need to be updated by the user                    #
######################################################

# set_property LOC AB5    [get_ports srio_rxn0]
# set_property LOC AB6    [get_ports srio_rxp0]
# set_property LOC Y1     [get_ports srio_txn0]
# set_property LOC Y2     [get_ports srio_txp0]



# set_property LOC W8     [get_ports sys_clkp]
# set_property LOC W7     [get_ports sys_clkn]
# set_property LOC R27    [get_ports sys_rst]

# set_property LOC Y22    [get_ports led0[7]]
# set_property LOC AA22   [get_ports led0[6]]
# set_property LOC Y23    [get_ports led0[5]]
# set_property LOC W21    [get_ports led0[4]]
# set_property LOC G2     [get_ports led0[3]]
# set_property LOC Y21    [get_ports led0[2]]
# set_property LOC AA23   [get_ports led0[1]]
# set_property LOC AA24   [get_ports led0[0]]

# set_property LOC AB24   [get_ports sim_train_en]


# set_property IOSTANDARD LVCMOS18 [get_ports sys_rst]
# set_property IOSTANDARD LVCMOS18 [get_ports sim_train_en]

# set_property IOSTANDARD LVCMOS18 [get_ports led0[7]]
# set_property IOSTANDARD LVCMOS18 [get_ports led0[6]]
# set_property IOSTANDARD LVCMOS18 [get_ports led0[5]]
# set_property IOSTANDARD LVCMOS18 [get_ports led0[4]]
# set_property IOSTANDARD LVCMOS18 [get_ports led0[3]]
# set_property IOSTANDARD LVCMOS18 [get_ports led0[2]]
# set_property IOSTANDARD LVCMOS18 [get_ports led0[1]]
# set_property IOSTANDARD LVCMOS18 [get_ports led0[0]]

################################################################################

