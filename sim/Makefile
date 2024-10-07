run:
	 xrun -uvmhome CDNS-1.2 -f filelist.f +define+UVM_NO_DPI +define+MYPACKAGE
run_alt:
	xrun -f filelist.f +define+UVM_NO_DPI +UVM_VERBOSITY=UVM_LOW +UVM_SHOW_VERSION
print:
	xrun -f filelist.f -top tb_top -l compile.log +UVM_VERBOSITY=UVM_HIGH +define+UVM_NO_DPI

