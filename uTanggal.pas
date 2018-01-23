unit uTanggal;
	{unit digunakan untuk mengoperasikan tipe bentukan tanggal}

interface
	type
		Tanggal = record
			d : integer;	{hari}
			m : integer;	{bulan}
			y : integer;	{tahun}
		end;

	procedure StringToTanggal (s: string; var t:Tanggal);
	{Melakukan konversi tipe string menjadi tipe bentukan tanggal}
	{I.S. s terdefinisi}
	{F.S. t diisi dengan tipe bentukan tanggal}

	function isKabisat(t:Tanggal):boolean;
	{menghasilkan true bila tanggal kabisat}
	
	procedure TambahTanggal(d:integer;var t:tanggal);
	{melakukan penambahan tanggal}
	{I.S. t dan d terdefinisi}
	{F.S. tanggal t akan bertambah sebanyak d}
		
	function SelisihTanggal(t1, t2 : Tanggal):integer;
	{fungsi untuk mengitung selisih dua tanggal}
implementation

	procedure StringToTanggal (s: string; var t:Tanggal);
	{Melakukan konversi tipe string menjadi tipe bentukan tanggal}
	{I.S. s terdefinisi}
	{F.S. t diisi dengan tipe bentukan tanggal}
	{kamus}
	var
		i,j : integer;
		found : boolean;
	{algoritma}
	begin
		i:= 1;
		j := 1;
		found := false;
		while ((i <= length(s)) and not(found)) do
			begin
				if((s[i] = '0') or (s[i] = '1') or (s[i] = '2') or (s[i] = '3') or (s[i] = '4') or (s[i] = '5') or (s[i] = '6') or (s[i] = '7') or (s[i] = '8') or (s[i] = '9') ) then
					i := i + 1
				else
					found := true;
			end;
		val(copy(s,j,i-j), t.d);	{Hari}
		
		j := i+1;
		i := i+1;
		found:=false;
		while ((i <= length(s)) and not(found)) do
			begin
				if((s[i] = '0') or (s[i] = '1') or (s[i] = '2') or (s[i] = '3') or (s[i] = '4') or (s[i] = '5') or (s[i] = '6') or (s[i] = '7') or (s[i] = '8') or (s[i] = '9') ) then
					i := i + 1
				else
					found := true;
			end;				
		val(copy(s,j,i-j), t.m);	{Bulan}
		
		j := i+1;
		i := i+1;
		found:= false;
		while ((i <= length(s)) and not(found)) do
			begin
				if((s[i] = '0') or (s[i] = '1') or (s[i] = '2') or (s[i] = '3') or (s[i] = '4') or (s[i] = '5') or (s[i] = '6') or (s[i] = '7') or (s[i] = '8') or (s[i] = '9') ) then
					i := i + 1
				else
					found := true;
			end;		
		val(copy(s,j,i-j),t.y);		{Tahun}
	end;
	
	
	function isKabisat(t:Tanggal):boolean;
	{menghasilkan true bila tanggal kabisat}
	begin
		isKabisat := (((t.y mod 4) = 0) and ((t.y mod 100) <> 0)) or (t.y mod 400 = 0);
	end;
	
	
	procedure TambahTanggal(d:integer;var t:tanggal);
	{melakukan penambahan tanggal}
	{I.S. t dan d terdefinisi}
	{F.S. tanggal t akan bertambah sebanyak d}
	{kamus}
	{algoritma}
	var
	i:integer;
	begin
		for i:=1 to d do
		begin
			case t.m of
				1, 3, 5, 7, 8, 10, 12 : begin
											if t.d = 31 then
											begin
												if t.m = 12 then
												begin
													t.d := 1;
													t.m := 1;
													t.y := t.y + 1;
												end
												else
												begin
													t.d := 1;
													t.m := t.m + 1;
													t.y := t.y;
												end;
											end
											else
											begin
												t.d := t.d + 1;
												t.m := t.m;
												t.y := t.y;
											end;
										end;
				4, 6, 9, 11 : begin
									if t.d = 30 then
									begin
										t.d := 1;
										t.m := t.m + 1;
										t.y := t.y;
									end
									else
									begin
										t.d := t.d + 1;
										t.m := t.m;
										t.y := t.y;
									end;
								end;
				2 : begin
						if (t.d = 28) and (isKabisat(t)) then
						begin
							t.d := 29;
							t.m := t.m;
							t.y := t.y;
						end
						else if (t.d = 28) and not(isKabisat(t)) then
						begin
							t.d := 1;
							t.m := t.m + 1;
							t.y := t.y;
						end
						else if t.d = 29 then
						begin
							t.d := 1;
							t.m := t.m + 1;
							t.y := t.y;
						end
						else
						begin
							t.d := t.d + 1;
							t.m := t.m;
							t.y := t.y;
						end;
					end;
			end;		
		end;
	end;
	
	function SelisihTanggal(t1, t2 : Tanggal):integer;
	{fungsi untuk mengitung selisih dua tanggal}
	{algoritma}
	begin
		SelisihTanggal := 0;
		while (t1.d <> t2.d) or (t1.m <> t2.m) or (t1.y <> t2.y) do
		begin
			TambahTanggal(1,t1);
			SelisihTanggal := SelisihTanggal + 1;
		end;
	end;
end.