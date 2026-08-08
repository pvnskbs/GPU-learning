TOP = top

SRC = \
+incdir+tb \
rtl/register.sv \
rtl/dff.sv \
rtl/mini_ip.sv \
tb/mini_ip_if.sv \
tb/mini_ip_pkg.sv \
tb/top.sv

compile:
	vlib work
	vmap work work
	vlog -sv $(SRC)

run:
	vsim -c -do run.do $(TOP)

gui:
	vsim $(TOP)

clean:
	rm -rf work transcript vsim.wlf