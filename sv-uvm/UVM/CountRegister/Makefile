TOP = top

SRC = \
+incdir+tb \
rtl/register.sv \
tb/register_if.sv \
tb/register_pkg.sv \
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