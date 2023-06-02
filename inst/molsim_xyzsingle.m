
function molsim_xyzsingle(idx1, idx2)	

	npartSingle = idx2-idx1+1;
	
	fout = fopen("molsim_single.xyz", "w");
	
	counter = 0;
	while (1) 	
		
		
		filename = sprintf("molsim-%05d.xyz", counter);
		
		if ( !exist(filename) ) 
			break; 
		endif
		
		[npart, parttypes, pos, vel, mass, charge, lbox] = molsim_readxyz(filename, 'sep'); 
		
			
		fprintf(fout, "%d\n", npartSingle);
		fprintf(fout, "Generated by molsim\n");
		for n=idx1:idx2
			
			fprintf(fout, "%c %f %f %f \n", parttypes(n), pos(n,1), pos(n,2), pos(n,3));
			
		endfor
			
		counter = counter + 1;
		
	endwhile
	
	fclose(fout);
	
endfunction
