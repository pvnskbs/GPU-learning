mini_ip:
          +-----------+
 d ------>|    DFF    |---- q ----+
 clk ---->|           |           |
 rst ---->|           |           |
      ||  +-----------+           |
      ||                          v
      ||                          en
      ||              clk  +--------------+
      |+-----------------> | Register     |
      +------------------> | / Counter    |
                      rst  +--------------+
                                  |
                               count

What does an interface provide?
An interface provides:

1. Signal bundling
2. Clock synchronization
3. Race-free communication
4. Direction control (modports)
5. A single handle passed as a virtual interface

virtual mini_soc_if.tb_mp
This prevents a driver from accidentally accessing signals it shouldn't, and it's a good coding discipline