unit uLoadSave;
	{unit yang bertugas untuk input dan output file eksternal}
	
interface
	
	uses uBajuCart, uTanggal;
	
	function EkstrakKata(s:string; x:integer):string;
	{fungsi menghasilkan kata pada partisi yang terpisah oleh tanda | yang ke- x}
	
	procedure LoadStok(D:ArrayOfString; var B:ArrayOfStok; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}

	procedure LoadEkspedisi(D:ArrayOfString; var B:ArrayOfEkspedisi; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}

	procedure LoadTransaksi(D:ArrayOfString; var B:ArrayOfTransaksi; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}

	procedure LoadCart(D:ArrayOfString; var B:ArrayOfCart; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	
	procedure ReadFile(FileEks:string; var A:ArrayOfString; var n:integer);
	{I.S. FileEks terdefinisi}
	{F.S. data pada file eksternal bernama 'FileEks' akan diisi ke A, n adalah banyaknya data}

	procedure SaveStok(var D:ArrayOfString; B:ArrayOfStok; n:integer);
	{procedure untuk meningput array tipe bentukan ke array string}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada B sebanyak n akan diinput ke D menjadi array string}	
	
	procedure SaveTransaksi(var D:ArrayOfString; B:ArrayOfTransaksi; n:integer);
	{procedure untuk meningput array tipe bentukan ke array string}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada B sebanyak n akan diinput ke D menjadi array string}
	
	procedure SaveCart(var D:ArrayOfString; B:ArrayOfCart; n:integer);
	{procedure untuk meningput array tipe bentukan ke array string}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada B sebanyak n akan diinput ke D menjadi array string}
	
	procedure WriteFile(FileEks:string; var A:ArrayOfString; n:integer);
	{I.S. A dan n terdefinisi}
	{F.S. data pada array of string A akan diisi ke file eksternal bernama FileEks, n adalah banyaknya data}	
	
	
implementation

	function EkstrakKata(s:string; x:integer):string;
	{fungsi menghasilkan kata pada partisi yang terpisah oleh tanda | yang ke- x}
	{kamus}
	var
		j, n, lower, upper : integer;
	{algoritma}
	begin
		j := 1;
		n := 0;
		if x = 1 then
		begin
			lower := 1;
		end
		else
		begin
			while n < (x-1) do
			begin
				if ((s[j] = ' ') and (s[j+1] = '|')) then
					n := n + 1;
				j := j + 1;
			end;
			lower := j + 2;
		end;
		j := lower;	
		while n < x do
		begin
			if ((s[j] = ' ') and (s[j+1] = '|')) then
				n := n + 1;
			j := j + 1;
		end;
		upper := j-2;
		EkstrakKata := (copy(s, lower, upper-lower+1));
	end;
	
	procedure LoadStok(D:ArrayOfString; var B:ArrayOfStok; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	{kamus}
	var
		i : integer;
		ec, errorcode: integer;
	{algoritma}
	begin
		for i := 1 to n do
			with B[i] do
			begin
				errorcode := 0;
				Nama := EkstrakKata(D[i], 1);
				Kategori := EkstrakKata(D[i], 2);
				Gender := EkstrakKata(D[i], 3);
				Warna := EkstrakKata(D[i], 4);
				Val(EkstrakKata(D[i], 5), Berat, ec);
				errorcode := errorcode + ec;
				Bahan := EkstrakKata(D[i], 6);
				Val(EkstrakKata(D[i], 7), Harga, ec);
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 8), UkuranS, ec);
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 9), UkuranM, ec);
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 10), UkuranL, ec);
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 11), UkuranXL, ec);
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 12), JumlahBeli, ec);
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 13), Diskon, ec);
				errorcode := errorcode + ec;
				if errorcode <> 0 then
					writeln ('  Error at string conversion stok.txt #', i);
			end;
	end;
		
	procedure LoadEkspedisi(D:ArrayOfString; var B:ArrayOfEkspedisi; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	{kamus}
	var
		i : integer;
		ec, errorcode: integer;
	{algoritma}
	begin
		for i := 1 to n do
			with B[i] do
			begin
				errorcode := 0;
				Nama := EkstrakKata(D[i], 1);
				JenisLayanan := EkstrakKata(D[i], 2);
				KotaTujuan := EkstrakKata(D[i], 3);
				Val(EkstrakKata(D[i], 4), Biaya, ec);
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 5), LamaPengiriman, ec);
				errorcode := errorcode + ec;
				if errorcode <> 0 then
					writeln ('  Error at string conversion ekspedisi.txt #', i);
			end;
	end;

	procedure LoadTransaksi(D:ArrayOfString; var B:ArrayOfTransaksi; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	{kamus}
	var
		i : integer;
		ec, errorcode: integer;
	{algoritma}
	begin
		for i := 1 to n do
			with B[i] do
			begin
				errorcode := 0;
				NamaBaju := EkstrakKata(D[i], 1);	{Nama Baju}
				Warna := EkstrakKata(D[i], 2);	{Warna Baju}
				Val(EkstrakKata(D[i], 3), Berat, ec);		{Berat per Baju (Kg)}
				errorcode := errorcode + ec;
				Bahan := EkstrakKata(D[i], 4);	{Bahan Baju}
				Val(EkstrakKata(D[i], 5), Harga, ec);	{Harga}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 6), UkuranS, ec);	{Keteserdiaan Ukuran}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 7), UkuranM, ec);	{Keteserdiaan Ukuran M}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 8), UkuranL, ec);	{Keteserdiaan Ukuran L}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 9), UkuranXL, ec);	{Keteserdiaan Ukuran XL}
				errorcode := errorcode + ec;
				NamaEkspedisi := EkstrakKata(D[i], 10);	{Nama Ekspedisi}
				JenisLayanan 	:= EkstrakKata(D[i], 11);	{Jenis Layanan Pengiriman}
				KotaTujuan := EkstrakKata(D[i], 12);	{Nama Kota Tujuan}
				Val(EkstrakKata(D[i], 13), Biaya, ec);	{Biaya Kirim Per Kg}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 14), LamaPengiriman, ec);	{Lama Pengiriman}
				errorcode := errorcode + ec;
				StringToTanggal(EkstrakKata(D[i], 15), TanggalKirim) ;	{Tanggal Pengiriman}
				if errorcode <> 0 then
					writeln ('  Error at string conversion transaksi.txt #', i);;
			end;
	end;
	
	procedure LoadCart(D:ArrayOfString; var B:ArrayOfCart; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	{kamus}
	var
		i : integer;
		ec, errorcode: integer;
	{algoritma}
	begin
		for i := 1 to n do
			with B[i] do
			begin
				errorcode := 0;
				Nama := EkstrakKata(D[i], 1);	{Nama Baju}
				Warna := EkstrakKata(D[i], 2);	{Warna Baju}
				Val(EkstrakKata(D[i], 3), Berat, ec);		{Berat per Baju (Kg)}
				errorcode := errorcode + ec;
				Bahan := EkstrakKata(D[i], 4);	{Bahan Baju}
				Val(EkstrakKata(D[i], 5), Harga, ec);	{Harga}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 6), JumlahBeliS, ec);	{Keteserdiaan Ukuran}
				errorcode := errorcode + ec;				
				Val(EkstrakKata(D[i], 7), JumlahBeliM, ec);	{Keteserdiaan Ukuran M}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 8), JumlahBeliL, ec);	{Keteserdiaan Ukuran L}
				errorcode := errorcode + ec;
				Val(EkstrakKata(D[i], 9), JumlahBeliXL, ec);	{Keteserdiaan Ukuran XL}
				errorcode := errorcode + ec;
				if errorcode <> 0 then
					writeln ('  Error at string conversion cart.txt #', i);
			end;
	end;
	
	procedure ReadFile(FileEks:string; var A:ArrayOfString; var n:integer);
	{I.S. FileEks terdefinisi}
	{F.S. data pada file eksternal bernama 'FileEks' akan diisi ke array of string A, n adalah banyaknya data}
	{kamus}
	var
		i : integer;	{looping}
		infile : text;	{file eksternal}
	{algoritma}
	begin
		assign(infile, FileEks);
		reset(infile);
		i := 1;
		n := 0;
		while not(EOF(infile)) do
		begin
			readln(infile, A[i]);
			i := i + 1;
			n := n + 1;
		end;
	close(infile);
	end;
	
	procedure SaveStok(var D:ArrayOfString; B:ArrayOfStok; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	{kamus}
	var
		i : integer;
		Berat, Harga, UkuranS, UkuranM, UkuranL, UkuranXL, JumlahBeli, Diskon : string;
	{algoritma}
	begin
		for i := 1 to n do
		begin
			Str(B[i].Berat:0:2, Berat);
			Str(B[i].Harga, Harga);
			Str(B[i].UkuranS, UkuranS);
			Str(B[i].UkuranM, UkuranM);
			Str(B[i].UkuranL, UkuranL);
			Str(B[i].UkuranXL, UkuranXL);
			Str(B[i].JumlahBeli, JumlahBeli);
			Str(B[i].Diskon, Diskon);
			D[i] := (B[i].Nama + ' | '+ B[i].Kategori + ' | ' + B[i].Gender + ' | ' + B[i].Warna + ' | ' + Berat +
			' | ' + B[i].Bahan + ' | ' + Harga + ' | ' + UkuranS + ' | ' + UkuranM + ' | ' + UkuranL + ' | ' +
			UkuranXL + ' | ' + JumlahBeli + ' | ' + Diskon);
		end
	end;
	
	procedure SaveTransaksi(var D:ArrayOfString; B:ArrayOfTransaksi; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	{kamus}
	var
		i : integer;
		Berat, Harga, UkuranS, UkuranM, UkuranL, UkuranXL, Biaya, LamaPengiriman, HariKirim, BulanKirim, TahunKirim: string;
	{algoritma}
	begin
		for i := 1 to n do
		begin
			Str(B[i].Berat:0:2, Berat);
			Str(B[i].Harga, Harga);
			Str(B[i].UkuranS, UkuranS);
			Str(B[i].UkuranM, UkuranM);
			Str(B[i].UkuranL, UkuranL);
			Str(B[i].UkuranXL, UkuranXL);
			Str(B[i].Biaya, Biaya);
			Str(B[i].LamaPengiriman, LamaPengiriman);
			Str(B[i].TanggalKirim.d, HariKirim);
			Str(B[i].TanggalKirim.m, BulanKirim);
			Str(B[i].TanggalKirim.y, TahunKirim);
			D[i] := (B[i].NamaBaju + ' | ' + B[i].Warna + ' | ' + Berat + ' | ' + B[i].Bahan + ' | ' + Harga +
			' | ' +	UkuranS + ' | ' + UkuranM + ' | ' + UkuranL + ' | ' + UkuranXL + ' | ' + B[i].NamaEkspedisi + 
			' | ' + B[i].JenisLayanan + ' | ' + B[i].KotaTujuan + ' | ' + Biaya + ' | ' + LamaPengiriman + ' | ' +
			HariKirim + '/' + BulanKirim + '/' + TahunKirim);
		end;
	end;
	
	procedure SaveCart(var D:ArrayOfString; B:ArrayOfCart; n:integer);
	{procedure untuk meload data pada file teks ke program}
	{I.S. D dan n terdefinisi, B sembarang}
	{F.S. elemen pada D sebanyak n akan diinput ke B menjadi array tipe bentukan}
	{kamus}
	var
		i : integer;
		Berat, Harga, JumlahBeliS, JumlahBeliM, JumlahBeliL, JumlahBeliXL : string;
	{algoritma}
	begin
		for i := 1 to n do
		begin
			Str(B[i].Berat:0:2, Berat);
			Str(B[i].Harga, Harga);
			Str(B[i].JumlahBeliS, JumlahBeliS);
			Str(B[i].JumlahBeliM, JumlahBeliM);
			Str(B[i].JumlahBeliL, JumlahBeliL);
			Str(B[i].JumlahBeliXL, JumlahBeliXL);
			D[i] := (B[i].Nama + ' | ' + B[i].Warna + ' | ' + Berat + ' | ' + B[i].Bahan + ' | ' + Harga +
			' | ' +	JumlahBeliS + ' | ' + JumlahBeliM + ' | ' + JumlahBeliL + ' | ' + JumlahBeliXL);
		end;
	end;
	
	procedure WriteFile(FileEks:string; var A:ArrayOfString; n:integer);
	{I.S. A dan n terdefinisi}
	{F.S. data pada array of string A akan diisi ke file eksternal bernama FileEks, n adalah banyaknya data}
	{kamus}
	var
		i : integer;	{looping}
		outfile : text;	{file eksternal}
	{algoritma}
	begin
		assign(outfile, FileEks);
		rewrite(outfile);
		for i := 1 to n do
		begin
			writeln(outfile, A[i]);
		end;
	close(outfile);
	end;
	
end.