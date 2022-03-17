set terminal postscript eps enhanced font 'Arial,22' size 5,4
set output 'Calc_data_ASD.eps'

set xrange [ 0 : 1 ]
set yrange [ * : * ]

set xtics 0.2
set ytics auto

set xlabel '{/Helvetica-Italic w}_{API}'
set ylabel '{/Helvetica-Italic T}/K'

set key right bottom Left inside reverse spacing 4

set linestyle 1 lt 7 	ps 2.5			lc rgb 'black'		# Exp. data
set linestyle 2 lt -1 	lw 3 			lc rgb 'purple'		# Ideal solubility
set linestyle 3 lt -1	lw 4 			lc rgb '#4b50be'	# PC-SAFT, SLE, user-defined kij
set linestyle 4 lt -1	lw 4			lc rgb '#ff8c00'	# PC-SAFT, SLE, optimized kij
set linestyle 5 lt 0	lw 16 pt 13 ps 2 	lc rgb '#4b50be'	# PC-SAFT, LLE, user-defined kij
set linestyle 6 lt 0	lw 16 pt 13 ps 2	lc rgb '#ff8c00'	# PC-SAFT, LLE, optimized kij

p	'Calc_data_SLE.dat'		using 2:1				ls 1	title 'Exp. data', \
	''				using 3:1	smooth unique		ls 2	title 'Ideal solubility', \
	''				using 4:1	smooth unique		ls 3	title 'SLE: User-defined {/Helvetica-Italic k}_{ij}(s)', \
	''				using 8:1	smooth unique		ls 4	title 'SLE: Optimized {/Helvetica-Italic k}_{ij}(s)', \
	'Calc_data_LLE.dat'	index 0	using 2:1	with linespoints	ls 5	title 'LLE: User-defined {/Helvetica-Italic k}_{ij}(s)', \
	''			index 0	using 3:1	with linespoints	ls 5	notitle 'LLE: User-defined {/Helvetica-Italic k}_{ij}(s)', \
	''			index 1	using 2:1	with linespoints	ls 6	title 'LLE: Optimized {/Helvetica-Italic k}_{ij}(s)', \
	''			index 1	using 3:1	with linespoints	ls 6	notitle 'LLE: Optimized {/Helvetica-Italic k}_{ij}(s)'


# NOTE: Solubility data in weight fraction, temperature in Kelvins.