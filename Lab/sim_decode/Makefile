clean:
	rm -r *.d 

comp_TRUE_RANDOM:
	echo "sth">>here.d && make clean && \
	xrun -f filelist.f -top tb -logfile comp.log +define+TEST_CASE=test_TRUE_RANDOM -timescale 1ns/1ps +define+LENGTH=4 +define+UVM_NO_DPI +UVM_VERBOSITY=UVM_HIGH



