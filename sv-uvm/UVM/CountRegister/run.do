# Create the simulation
vsim -voptargs=+acc top

# Log all signals
log -r /*

# Add all signals to the wave window
add wave -r /*

# Run until completion
run -all

# Quit simulator
quit -f