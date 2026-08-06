TOP = top

SRC = \
+incdir+tb \
rtl/dff.sv \
tb/dff_if.sv \
tb/dff_pkg.sv \
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