unit uBajuCart;
	{unit digunakan untuk keperluan transaksi}
	
interface
	uses uTanggal;
	
	type
		Stok = record
			Nama			: string;	{Nama Stok}
			Kategori		: string; 	{Kategori Stok}
			Gender 			: string;	{Gender}
			Warna			: string;	{Warna Stok}
			Berat			: real;		{Berat per Stok (Kg)}
			Bahan			: string;	{Bahan Stok}
			Harga			: longint;	{Harga}
			UkuranS			: integer;	{Keteserdiaan Ukuran} 
			UkuranM			: integer;	{Keteserdiaan Ukuran M}
			UkuranL			: integer;	{Keteserdiaan Ukuran L}
			UkuranXL		: integer;	{Keteserdiaan Ukuran XL}
			JumlahBeli		: integer;	{Jumlah Pembelian}
			Diskon			: integer;	{Diskon Grosir, nilai dalam bentuk persen}
		end;
	
		Cart = record
			Nama			: string;	{Nama Stok}
			Warna			: string;	{Warna Stok}
			Berat			: real;		{Berat per Stok (Kg)}
			Bahan			: string;	{Bahan Stok}
			Harga			: longint;	{Stok}
			JumlahBeliS		: integer;	{Jumlah Beli Ukuran S}
			JumlahBeliM		: integer;	{Jumlah Beli Ukuran M}
			JumlahBeliL		: integer;	{Jumlah Beli Ukuran L}
			JumlahBeliXL	: integer;	{Jumlah Beli Ukuran XL}
		end;
		
		Ekspedisi = record
			Nama			: string;	{Nama Ekspedisi}
			JenisLayanan 	: string;	{Jenis Layanan Pengiriman}
			KotaTujuan		: string;	{Nama Kota Tujuan}
			Biaya			: integer;	{Biaya Kirim Per Kg}
			LamaPengiriman	: integer;	{Lama Pengiriman}
		end;
		
		Transaksi = record
			NamaBaju		: string;	{Nama Baju}
			Warna			: string;	{Warna Baju}
			Berat			: real;		{Berat per Baju (Kg)}
			Bahan			: string;	{Bahan Baju}
			Harga			: longint;	{Harga}
			UkuranS			: integer;	{Keteserdiaan Ukuran} 
			UkuranM			: integer;	{Keteserdiaan Ukuran M}
			UkuranL			: integer;	{Keteserdiaan Ukuran L}
			UkuranXL		: integer;	{Keteserdiaan Ukuran XL}
			NamaEkspedisi	: string;	{Nama Ekspedisi}
			JenisLayanan 	: string;	{Jenis Layanan Pengiriman}
			KotaTujuan		: string;	{Nama Kota Tujuan}
			Biaya			: integer;	{Biaya Kirim Per Kg}
			LamaPengiriman	: integer;	{Lama Pengiriman}
			TanggalKirim	: Tanggal;	{Tanggal Pengiriman}
		end;
		
		
		ArrayOfStok = Array [1..100] of Stok; {Array dengan tipe data Stok}
		ArrayOfEkspedisi = Array [1..100] of Ekspedisi; {Array dengan tipe data Ekspedisi}
		ArrayOfCart = Array [1..100] of Cart; {Array dengan tipe data Cart}
		ArrayOfTransaksi = Array [1..100] of Transaksi; {Array dengan tipe data Transaksi}
		ArrayOfString = array [1..100] of string; {Array dengan tipe data string}
		ArrayOfReal = array [1..100] of string;	{Array dengan tipe data real}
		ArrayOfInteger = array [1..100] of integer;	{Array dengan tipe data integer}
	
	
	procedure showDataStok(B:Stok);
	{menampilkan data Stok pada layar}
	{I.S. B terdefinisi}
	{F.S. variabel yang tersimpan di B akan ditampilkan di layar}
	
	procedure showDataStokV2(B:Stok);
	{menampilkan data Stok pada layar dengan lebih sederhana}
	{I.S. B terdefinisi}
	{F.S. variabel yang tersimpan di B akan ditampilkan di layar}
	
	procedure showDataCart(C:Cart);
	{menampilan data isi shopping cart pada layar}
	{I.S. C terdefinisi}
	{F.S. variabel yang tersimpan di C akan ditampilkan di layar}

	procedure showDetailProduct(ABaju:ArrayOfStok; nStok:integer);
	{procedure untuk menampilkan detil dari baju tertentu}
	{I.S. S dan Nstok terdefinisi}
	{F.S. data dari nama baju tertentu akan ditampilkan di layar}	

	procedure menuEkspedisi(var pilihan: Integer);
	// menampilkan menu untuk showExpedition
	// I.S -
	// F.S mendapatkan nilai pilihan yang akan digunakan untuk perintah pada program	
	
	procedure showExpedition(A: ArrayOfEkspedisi; n:Integer);
	{menampilkan data ekspedisi pengiriman}
	{I.S. A dan n terdefinisi}
	{F.S. Menampilkan ekspedisi tergantung dari kota atau semua kota}

	Procedure sortArray2(A: ArrayOfStok; var B: ArrayOfStok; N:Integer);
	{procedure untuk mengurut stok berdasarkan jumlah beli}
	{I.S. A dan N terdefisini}
	{F.S. B akan berisi array A yang terurut}

	procedure showPopulars(A: ArrayOfStok; var B: ArrayOfStok; N:Integer);
	{menampilkan 3 barang terpopuler/paling banyak dibeli}
	{I.S. A dan N terdefisini}
	{F.S. B akan berisi array A setelah di sort, dan 3 teratas akan ditampilkan di layar}	

	procedure menuHarga(var pilihan: Integer);
	{ I.S - }
	{ F.S mendapatkan nilai pilihan yang akan digunakan untuk perintah pada program }
	
	procedure sortArray(A: ArrayOfStok; var B: ArrayOfStok; N:Integer; opt:Char);
	{menyusun isi array berdasarkan harga}
	{I.S. A, N, dan opt terdefinisi}
	{F.S. B akan terisi oleh array A yang telah disusun}
	
	procedure sortPrice(ABaju,B:ArrayOfStok; nStok:integer);
	{I.S harga baju sudah terdefinisi}
	{F.S Menampilkan baju yang harganya disusun berdasarkan harga jual}	
	
	procedure searchClothesByKeyword(DataStok:ArrayOfStok; nStok:integer); {dibuat oleh Bobbi}
	{menampilkan data Stok berdasarkan hasil search user}
	{I.S Datastok dan keyword terdefinisi}
	{F.S hasil akan ditampilkan ke layar}
	
	procedure updateClothes(var DataStok:ArrayOfStok; DataCart:ArrayOfCart; x:integer; Nstok, Ncart:integer);{dibuat oleh Bobbi}
	{mengupdate data stok Stok setelah terjadi transaksi}
	{I.S DataStok, DataCart, x, Nstok, Ncart terdefinisi}
	{F.S Datastok diperbarui berdasarkan input}
	
	procedure discountGrosir(DataCart:ArrayOfCart; DataStok:ArrayOfStok; Ncart:integer; nStok:integer;
							var diskon:ArrayOfInteger); {dibuat oleh Bobbi}
	{menghitung diskon pada suatu barang tertentu apabila membeli barang minimal 10 buah}
	{I.S DataCart terdefinisi, DataaStok terdefinisi, Ncart terdefinisi}
	{F.S diskon untuk setiap barang terdefinisi dalam bentuk array of real} 

	procedure calculatePrice (C:ArrayOfCart; nCart:integer; diskon:ArrayOfInteger);
	{ menampilkan isi shopping cart saat ini serta menghitung dan menampilkan harga total 
	  dan berat total barang berdasarkan isi shopping cart saat ini. }
	{ I.S. C dan diskon terdefinisi }
	{ F.S. Ditampilkan isi C, harga total, dan berat total }

	procedure filterClothes (T:ArrayOfStok; n:integer);
	{ Sistem penyeleksian baju yaitu diseleksi pertama menurut gender. Lalu baju yang sudah terseleksi menurut gender akan
		diseleksi menurut kategori. Lalu yang sudah terseleksi menurut kategori akan diseleksi lagi menurut warna. Dan yang
		sudah terseleksi akan diseleksi lagi menurut ukuran }
	{ Penyeleksian gender dilakukan dengan menyeleksi array yang berisi daftar semua baju, lalu hasilnya dimasukkan ke array baru.
		Lalu penyeleksian kategori, ukuran, dan warna dilakukan dengan menyeleksi daftar baju yang sudah masuk ke array baru tersebut }
	{ Jika pengguna mem-multiple filter dengan menginput 'semua', maka seluruh isi array akan dicopy tanpa ada yang diseleksi }
	{ p dan q berperan sebagai Neff baru dari setiap penyeleksian yang nilainya semakin lama semakin kecil }
	{ I.S. T terdefinisi. gender, kategori, ukuran, dan warna sembarang }
	{ F.S. menampilkan baju yang lolos seleksi }	
	
	procedure filterByPrice (T:ArrayOfStok; nStok:integer);
	{ menampilkan barang dengan harga paling murah dan/atau harga paling mahal, sebelum dan sesudah diskon grosir. }
	{ I.S. T terdefinisi. urut sebarang }
	{ F.S. menampilkan barang termurah dan termahal }
	
	procedure retur(T:ArrayOfTransaksi; S:ArrayOfStok; nTransaksi:integer);
	{Melakukan retur/pengembalian barang cacat}
	{I.S. S dan T terdefinisi}
	{F.S. Menampilkan harga yang dikembalikan bila selisih hari < 14}
	
	procedure tukar (var a,b:transaksi);
	{I.S. a dan b terdefinisi}
	{F.S. a dan b ditukar nilainya}
	
	procedure SortTanggalKirim(T1:ArrayOfTransaksi;Ntransaksi:integer ;var T2:ArrayOfTransaksi);
	{I.S. T1 dan Ntransaksi terdefinisi}
	{F.S. T2 terisi dengan tanggal kirim terurut menurun}
	
	procedure ShowTransaction(T1:ArrayOfTransaksi;Ntransaksi:integer);
	{I.S. T1 dan Ntransaksi terdefinisi}
	{F.S. transaksi berdasarkan urutan tanggal dituliskan ke layar}	

	procedure addToCart (var T:ArrayOfStok; var C:ArrayOfCart; nStok:integer; var nCart:integer);
	{ Menuliskan barang pesanan ke dalam file eksternal }
	{ Jumlah barang yang dipesan tidak boleh lebih besar dari dari stok yang tersedia }
	{ Program akan menampilkan pesan jika jumlah pesanan lebih besar dari stok yang ada }
	{ I.S. T, C, nCart dan nStok terdefinisi }
	{ F.S. C terisi barang pesanan }	

	procedure removeFromCart (var T:ArrayOfStok; var C:ArrayOfCart; nStok:integer; var nCart:integer);
	{ mnghapuskan pesanan yagn dipilih pengguna dari Cart }
	{ I.S. T, C, nStok, dan nCart terdefinisi }
	{ F.S. C akan berisi barang pesanan sudah diperbaharui }

	procedure calculatePriceCart (C:ArrayOfCart; nCart:integer; diskon:ArrayOfInteger ; var beratcart:real; var hargacart:real);
	{menghitung harga total barang-barang dalam cart}
	{I.S. C, nCart, DataStok, dan nStok terdefinisi}
	{F.S. beratcart dan hargacart akan diisi nilainya}

	procedure checkout(var DataStok:ArrayOfStok; DataEkspedisi:ArrayOfEkspedisi; var DataCart:ArrayOfCart; var DataTransaksi:ArrayOfTransaksi; nStok, nEkspedisi:integer; var nTransaksi,nCart:integer );
	{melakukan checkout barang, mengosongkan cart, menambahkan data pada array transaksi}
	{I.S. DataStok, DataEkspedisi, DataCart, DataTransaksi, nStok, nTransaksi, dan nCart terdefinisi}
	{F.S. menampilkan harga total, mengosongkan array cart, menambah entri pada array transaksi, mengupdate jumlah barang di array stok}
	
	function mirip(Cat:String; warna:String; Gender:String; Bahan:String; Baju:Stok):Integer; 
	{Memberikan kuantitas kemiripan barang}
	
	procedure recommendation(ABaju:ArrayOfStok; nStok:integer; ACart:ArrayOfCart; nCart:integer);
	{memunculkan rekomendasi barang dengan acuan barang yang terakhir ditambahkan ke cart}
	{I.S ABaju, nStok, ACart, nCart terdefinisi}
	{F.S menampilkan baju rekomendasi dari penambahan cart terakhir barang}

implementation

	procedure showDataStok(B:Stok);
	{menampilkan data Stok pada layar}
	{I.S. B terdefinisi}
	{F.S. variabel yang tersimpan di B akan ditampilkan di layar}
	{algoritma}
	begin
		with B do
		begin
			writeln('  ',Nama);
			writeln('  ', Kategori);
			writeln('  ', Gender);
			writeln('  ', Warna);
			writeln('  ', Berat:0:2, ' Kg');
			writeln('  ', Bahan);
			writeln('  Rp ', Harga);
			write('  ', 'S: ', UkuranS);
			write('  ', 'M: ', UkuranM);
			write('  ', 'L: ', UkuranL);
			writeln('  ', 'XL: ', UkuranXL);
			writeln('  Jumlah Pembelian: ', JumlahBeli);
			writeln('  Diskon Grosir: ', Diskon, '%');
			writeln;
		end;
	end;
	
	procedure showDataStokV2(B:Stok);
	{menampilkan data Stok pada layar dengan lebih sederhana}
	{I.S. B terdefinisi}
	{F.S. variabel yang tersimpan di B akan ditampilkan di layar}
	{algoritma}
	begin
		with B do
		begin
			write('  ', Nama);
			write(' | ', Kategori);
			write(' | ', Gender);
			write(' | ', Warna);
			write(' | ', Berat:0:2);
			write(' | ', Bahan);
			write(' | ', Harga);
			write(' | ', UkuranS);
			write(' | ', UkuranM);
			write(' | ', UkuranL);
			write(' | ', UkuranXL);
			write(' | ', JumlahBeli);
			writeln(' | ', Diskon);
		end;
	end;	
	
	procedure showDataCart(C:Cart);
	{menampilan data isi shopping cart pada layar}
	{I.S. C terdefinisi}
	{F.S. variabel yang tersimpan di C akan ditampilkan di layar}
	begin
		with C do
		begin
			writeln('  ', Nama);
			writeln('  ', Warna);
			writeln('  ', Berat, ' Kg');
			writeln('  ', Bahan);
			writeln('  Rp ', Harga);
			write('  ', 'S: ', JumlahBeliS);
			write('  ', 'M: ', JumlahBeliM);
			write('  ', 'L: ', JumlahBeliL);
			writeln('  ', 'XL: ', JumlahBeliXL);
		end;
	end;

	procedure showDetailProduct(ABaju:ArrayOfStok; nStok:integer);
	{procedure untuk menampilkan detil dari baju tertentu}
	{I.S. S dan Nstok terdefinisi}
	{F.S. data dari nama baju tertentu akan ditampilkan di layar}
	{kamus}
	var
		inpNama	 	: String; // Input nama baju
		i			: Integer; //looping
		count		: Integer; //memberi tanda bila baju ditemukan
	{algoritma}
	begin
		write('> Masukkan Nama Baju yang ingin ditampilkan informasinya = ');
		readln(inpNama);
		count := 0;
		for i := 1 to nStok do
		begin
			if lowercase(inpNama) = lowercase(ABaju[i].Nama) then 
			begin
				writeln('  Nama Baju = ',ABaju[i].Nama);
				writeln('  Kategori = ', ABaju[i].Kategori);
				writeln('  Gender = ', ABaju[i].Gender);
				writeln('  Warna = ',ABaju[i].Warna);
				writeln('  Berat Baju = ', ABaju[i].Berat:0:2, ' Kg');
				writeln('  Bahan = ', ABaju[i].Bahan);
				writeln('  Harga = Rp ', ABaju[i].Harga);
				writeln('  Ukuran S = ', ABaju[i].UkuranS);
				writeln('  Ukuran M = ', ABaju[i].UkuranM);
				writeln('  Ukuran L = ',ABaju[i].UkuranL);
				writeln('  Ukuran XL = ', ABaju[i].UkuranXL);
				writeln('  Jumlah Pembelian = ', ABaju[i].JumlahBeli);
				writeln('  Diskon Grosir = ', ABaju[i].Diskon, '%');
				count:=1;
			end;
		end;
		if count = 0 then 
		begin
			writeln('  Maaf baju yang anda cari tidak ada pada database kami');
		end;
		writeln;
	end;	
	
	procedure menuEkspedisi(var pilihan: Integer);
	// menampilkan menu untuk showExpedition
	// I.S -
	// F.S mendapatkan nilai pilihan yang akan digunakan untuk perintah pada program
	// algoritma
	begin
		repeat
		writeln('> Menu Ekspedisi');
		writeln('  1. Ekspedisi seluruh kota');
		writeln('  2. Ekspedisi kota yang anda inginkan');
		writeln('  3. Kembali ke menu utama');
		write('> Masukkan pilihan anda = ');
		readln(pilihan);
		if (pilihan < 1) or (pilihan > 3) then
		begin
			writeln('Masukan menu salah! Harap diinput ulang');
		end;
		until ((pilihan=1) or (pilihan=2) or (pilihan=3));
	end;	

	procedure showExpedition(A: ArrayOfEkspedisi; n:Integer);
	{menampilkan data ekspedisi pengiriman}
	{I.S. A dan n terdefinisi}
	{F.S. Menampilkan ekspedisi tergantung dari kota atau semua kota}
	{ Kamus }
	var
		i		: integer; 
		count 	: integer; // data untuk aksi-kondisi
		kota	: string;  // input nama kota
		pilihan	: integer; // pilihan pada menu
	{ Algoritma }
	begin
		repeat
		menuEkspedisi(pilihan);
		case pilihan of
		1: begin
				for i:=1 to n do 
				begin
					writeln('  Nama Ekspedisi     = ', A[i].Nama); 		
					writeln('  Jenis Layanan      = ', A[i].JenisLayanan);	
					writeln('  Nama Kota          = ', A[i].KotaTujuan);			
					writeln('  Biaya kirim /kg    = ', A[i].Biaya);		
					writeln('  Lama Pengiriman    = ', A[i].LamaPengiriman);
					writeln();
				end;
			end;	
		2: begin
				write('> Masukkan nama kota = ');
				readln(kota);
				for i:= 1 to n do
				begin
					with A[i] do 
					if lowercase(kota) = lowercase(KotaTujuan) then
					begin
						writeln('  Nama Ekspedisi     = ', A[i].Nama); 		
						writeln('  Jenis Layanan      = ', A[i].JenisLayanan);	
						writeln('  Nama Kota          = ', A[i].KotaTujuan);			
						writeln('  Biaya kirim/kg    = ', A[i].Biaya);		
						writeln('  Lama Pengiriman    = ', A[i].LamaPengiriman);
						writeln();
						count:=1;
					end;
				end;
				if count<>1 then 
				begin
					writeln('  Maaf pengiriman pada kota ', kota, ' belum tersedia ');
				end;
			end;
		end;
		until(pilihan=3);
	end;
		
	Procedure sortArray2(A: ArrayOfStok; var B: ArrayOfStok; N:Integer);
	{procedure untuk mengurut stok berdasarkan jumlah beli}
	{I.S. A dan N terdefisini}
	{F.S. B akan berisi array A yang terurut}
	{kamus}
	var
		C: Stok;
		i, j : integer;
	{algoritma}
	begin
		for i:=1 to N do
		begin
			B[i]:=A[i];
		end;
		For i := N DownTo 1 do
		Begin
			For j := 2 to i do
			Begin
				If (A[j-1].JumlahBeli) < (A[j].JumlahBeli) then
				Begin
					C:= A[j-1];
					A[j-1] := A[j];
					A[j] := C;
				End;
			End;
		End;
		for i:=1 to N do 
		begin
			C:=B[i];
			B[i]:=A[i];
			A[i]:=C;
		end;
	end;	
	
	procedure showPopulars(A: ArrayOfStok; var B: ArrayOfStok; N:Integer);
	{menampilkan 3 barang terpopuler/paling banyak dibeli}
	{I.S. A dan N terdefisini}
	{F.S. B akan berisi array A setelah di sort, dan 3 teratas akan ditampilkan di layar}
	{kamus}
	var
		i : integer;
	{algoritma}
	begin
		sortArray2(A, B, N);
		for i:=1 to 3 do 
		begin
			writeln('> ',i,'. ',B[i].Nama);
			writeln('  Warna: ',B[i].Warna);
			write('  S: ', B[i].UkuranS,' ');
			write('M: ', B[i].UkuranM,' ');
			write('L: ',B[i].UkuranL,' ');
			writeln('XL: ', B[i].UkuranXL,' ');
			writeln('  Rp ', B[i].Harga);
			writeln('  Banyak Dibeli = ', B[i].JumlahBeli);
			writeln;
		end;
	end;
	
	procedure menuHarga(var pilihan: Integer);
	{ I.S - }
	{ F.S mendapatkan nilai pilihan yang akan digunakan untuk perintah pada program }
	begin
		repeat
		writeln('> Menu Urut Harga');
		writeln('  1. Dari Termahal ke Termurah');
		writeln('  2. Dari Termurah ke Termahal');
		writeln('  3. Kembali ke menu utama');
		write('> Masukkan pilihan anda = ');
		readln(pilihan);
		if (pilihan < 1) or (pilihan > 3) then
		begin
			writeln('  Masukan menu salah! Harap diinput ulang');
		end;
		until ((pilihan=1) or (pilihan=2) or (pilihan=3));
	end;	

	procedure sortArray(A: ArrayOfStok; var B: ArrayOfStok; N:Integer; opt:Char);
	{menyusun isi array berdasarkan harga}
	{I.S. A, N, dan opt terdefinisi}
	{F.S. B akan terisi oleh array A yang telah disusun}
	var
		C: Stok;
		i, j : integer;
	begin
		for i:=1 to N do
		begin
			B[i]:=A[i];
		end;
		if opt='>' then
		begin
			For i := N DownTo 1 do
			Begin
				For j := 2 to i do
				Begin
					If (A[j-1].Harga) < (A[j].Harga) then
					Begin
						C:= A[j-1];
						A[j-1] := A[j];
						A[j] := C;
					End;
				End;
			End;
		end else if opt='<' then
			begin
				For i := N DownTo 1 do
				Begin
					For j := 2 to i do
					Begin
						If (A[j-1].Harga) > (A[j].Harga) then
						Begin
							C:= A[j-1];
							A[j-1] := A[j];
							A[j] := C;
						End;
					End;
				End;
			end;
		for i:=1 to N do 
		begin
			C:=B[i];
			B[i]:=A[i];
			A[i]:=C;
		end;
	end;
	
	procedure sortPrice(ABaju,B:ArrayOfStok; nStok:integer);
	{I.S harga baju sudah terdefinisi}
	{F.S Menampilkan baju yang harganya disusun berdasarkan harga jual}
	{kamus}
	var 
		i 			: Integer; 
		pil			: Integer; 
		s			: string;
		keluar		: boolean;
	{algoritma}
	begin
		repeat
		begin
			menuHarga(pil);
			case pil of
			1: 	sortArray(ABaju, B, nStok, '>');
			2: 	sortArray(ABaju, B, nStok, '<');
			end;
			if (pil <> 3) then
			begin
				i := 1;
				keluar := false;
				while (i <= nStok) and not(keluar) do 
				begin
					writeln('> Nama Baju = ',B[i].Nama);
					writeln('  Kategori = ', B[i].Kategori);
					writeln('  Gender = ', B[i].Gender);
					writeln('  Warna = ',B[i].Warna);
					writeln('  Berat Baju = ', B[i].Berat:0:2, ' Kg');
					writeln('  Bahan = ', B[i].Bahan);
					writeln('  Harga = Rp ', B[i].Harga);
					writeln('  Ukuran S = ', B[i].UkuranS);
					writeln('  Ukuran M = ', B[i].UkuranM);
					writeln('  Ukuran L = ',B[i].UkuranL);
					writeln('  Ukuran XL = ', B[i].UkuranXL);
					writeln('  Jumlah Beli = ', B[i].JumlahBeli);
					writeln('  Diskon Grosir = ', B[i].Diskon, '%');
					writeln;
					writeln('  Tekan Enter untuk baju selanjutnya');
					writeln('  Ketik <berhenti> untuk berhenti');
					write('  ');
					i := i + 1;
					readln(s);
					if s <> ('') then
						keluar := true;
				end;
			end;
		end;
		until (pil=3);
		writeln;
	end;
	
	procedure searchClothesByKeyword(DataStok:ArrayOfStok; nStok:integer); {dibuat oleh Bobbi}
	{menampilkan data Stok berdasarkan hasil search user}
	{I.S Datastok dan keyword terdefinisi}
	{F.S hasil akan ditampilkan ke layar}
	{KAMUS LOKAL}
	var
		i:integer;	{looping}
		hasil:Stok;	{menyimpan nilai sementara untuk ditampilkan}
		keyword:string;
	{AlGORITMA}
	begin
		write('> keyword: ');
		readln(keyword);
		for i:= 1 to nStok do
		begin
			if (lowercase(keyword) = lowercase(DataStok[i].Nama)) or (lowercase(keyword) = lowercase(DataStok[i].Warna))
				or (lowercase(keyword) = lowercase(DataStok[i].Kategori)) then 
			begin
				hasil:=DataStok[i];
				showDataStok(hasil);
			end;
		end;
	end;
	
	procedure updateClothes(var DataStok:ArrayOfStok; DataCart:ArrayOfCart; x:integer; Nstok, Ncart:integer);{dibuat oleh Bobbi}
	{mengupdate data stok Stok setelah terjadi transaksi}
	{I.S DataStok, DataCart, x, Nstok, Ncart terdefinisi}
	{F.S Datastok diperbarui berdasarkan input}
	{KAMUS LOKAL}
	var
		i:integer;
	{ALGORITMA}
	begin
		for i:=1 to Nstok do
		begin
			if DataCart[x].Nama = DataStok[i].Nama then
			begin
				DataStok[i].UkuranS := DataStok[i].UkuranS - DataCart[x].JumlahBeliS;
				DataStok[i].UkuranM := DataStok[i].UkuranM - DataCart[x].JumlahBeliM;
				DataStok[i].UkuranL := DataStok[i].UkuranL - DataCart[x].JumlahBeliL;
				DataStok[i].UkuranXL := DataStok[i].UkuranXL - DataCart[x].JumlahBeliXL;
				DataStok[i].JumlahBeli := DataStok[i].JumlahBeli + (DataCart[x].JumlahBeliS + DataCart[x].JumlahBeliM + DataCart[x].JumlahBeliL
										+ DataCart[x].JumlahBeliXL);
			end;
		end;	
	end;
	
	procedure discountGrosir(DataCart:ArrayOfCart; DataStok:ArrayOfStok; Ncart:integer; nStok:integer; var diskon:ArrayOfInteger); {dibuat oleh Bobbi}
	{menghitung diskon pada suatu barang tertentu apabila membeli barang minimal 10 buah}
	{I.S DataCart terdefinisi, DataStok terdefinisi, Ncart terdefinisi}
	{F.S diskon untuk setiap barang terdefinisi dalam bentuk array of real} 
	{KAMUS LOKAL}
	var
	sum: ArrayOfInteger;
	i,j:integer;
	x:ArrayOfInteger;
	{ALGORITMA}
	begin
		for i:=1 to Ncart do 
		begin
			sum[i]:=0;
			sum[i]:= sum[i] + DataCart[i].JumlahBeliS + DataCart[i].JumlahBeliM + DataCart[i].JumlahBeliL + DataCart[i].JumlahBeliXL;
			for j:=1 to nStok do
			begin
				if (DataStok[j].Nama = DataCart[i].Nama) then
				begin
					x[i]:=DataStok[j].Diskon;
				end;
			end;
			if sum[i] >= 10 then
			begin
				diskon[i] := (sum[i] div 10)*x[i];
				if diskon[i] > 50 then diskon[i]:= 50;
			end;
		end;
	end;
	
	procedure calculatePrice (C:ArrayOfCart; nCart:integer; diskon:ArrayOfInteger);
	{ menampilkan isi shopping cart saat ini serta menghitung dan menampilkan harga total 
	  dan berat total barang berdasarkan isi shopping cart saat ini. }
	{ I.S. C dan diskon terdefinisi }
	{ F.S. Ditampilkan isi C, harga total, dan berat total }
	{kamus}
	var
		i : integer;
		weight : real;
		sumharga : real;
		jumlah : integer;	{ jumlah baju S,M,L, dan XL yang dibeli }
	{algoritma}
	begin
		weight := 0;
		sumharga := 0;
		{ Menampilkan isi shopping cart dan menghitung total harga dan berat }
		for i := 1 to nCart do
		begin
			jumlah := C[i].JumlahBeliS + C[i].JumlahBeliM + C[i].JumlahBeliL + C[i].JumlahBeliXL;
			weight := weight + (C[i].Berat*jumlah);
			writeln ('> ',i,'. Nama	: ',C[i].Nama);
			writeln ('  Warna : ',C[i].Warna);
			writeln ('  Berat : ',C[i].Berat:0:2, ' kg');
			writeln ('  Bahan : ',C[i].Bahan);
			writeln ('  Harga : Rp ',C[i].Harga);
			writeln ('  Jumlah Beli Ukuran S : ',C[i].JumlahBeliS);
			writeln ('  Jumlah Beli Ukuran M : ',C[i].JumlahBeliM);
			writeln ('  Jumlah Beli Ukuran L : ',C[i].JumlahBeliL);
			writeln ('  Jumlah Beli Ukuran XL : ',C[i].JumlahBeliXL);
			writeln ('  Diskon Grosir : ',diskon[i], '%');
			writeln('  Rp ', C[i].Harga, ' x ', jumlah, ' = ', C[i].Harga*jumlah);
			writeln ('  ');
			{ Menghitung total harga }
			if (diskon[i] > 0) then
			begin
				sumharga := sumharga + ((C[i].Harga*jumlah)*(1-diskon[i]*0.01));
			end else { diskon = 0 }
				sumharga := sumharga + (C[i].Harga*jumlah);
		end;
		
		{ Menampilkan total harga dan total berat }
		writeln ('> Total Harga : Rp ',sumharga:0:2);
		writeln ('> Berat Total Barang : ',weight:0:2);
	end;
	
	procedure filterClothes (T:ArrayOfStok; n:integer);
	{ Sistem penyeleksian baju yaitu diseleksi pertama menurut gender. Lalu baju yang sudah terseleksi menurut gender akan
		diseleksi menurut kategori. Lalu yang sudah terseleksi menurut kategori akan diseleksi lagi menurut warna. Dan yang
		sudah terseleksi akan diseleksi lagi menurut ukuran }
	{ Penyeleksian gender dilakukan dengan menyeleksi array yang berisi daftar semua baju, lalu hasilnya dimasukkan ke array baru.
		Lalu penyeleksian kategori, ukuran, dan warna dilakukan dengan menyeleksi daftar baju yang sudah masuk ke array baru tersebut }
	{ Jika pengguna mem-multiple filter dengan menginput 'semua', maka seluruh isi array akan dicopy tanpa ada yang diseleksi }
	{ p dan q berperan sebagai Neff baru dari setiap penyeleksian yang nilainya semakin lama semakin kecil }
	{ I.S. T terdefinisi. gender, kategori, ukuran, dan warna sembarang }
	{ F.S. menampilkan baju yang lolos seleksi }
	{kamus}
	type
		filter = record
			nama : string;
			kategori : string;
			warna : string;
			S : integer;
			M : integer;
			L : integer;
			XL : integer;
			harga : real;
		end;
		tabfilter = array [1..100] of filter;
	var
		i, j : integer;
		A, B : tabfilter;
		p, q : integer;
		g, k, u, w : string;
	{algoritma}
	begin
		write ('> gender : '); readln(g);
		write ('> kategori : '); readln(k);
		write ('> ukuran : '); readln(u);
		write ('> warna : '); readln(w);

		{ Seleksi sesuai gender }
		q := 0;
		for i := 1 to n do 
		begin
			if (lowercase(g) = lowercase(T[i].Gender)) or (lowercase(g) = 'semua') or (g = '') then
			begin
				q := q+1;
				A[q].nama := T[i].Nama;
				A[q].kategori := T[i].Kategori;
				A[q].warna := T[i].Warna;
				A[q].S := T[i].UkuranS;
				A[q].M := T[i].UkuranM;
				A[q].L := T[i].UkuranL;
				A[q].XL := T[i].UkuranXL;
				A[q].harga := T[i].Harga;
			end;
		end;
		
		{ Seleksi sesuai kategori }
		p := 0;
		for i := 1 to q do
		begin
			if (lowercase(k) = lowercase(A[i].kategori)) or (lowercase(k) = 'semua') or (k = '') then
			begin
				p := p+1;
				B[p].nama := A[i].nama;
				B[p].kategori := A[i].kategori;
				B[p].warna := A[i].warna;
				B[p].S := A[i].S;
				B[p].M := A[i].M;
				B[p].L := A[i].L;
				B[p].XL := A[i].XL;
				B[p].harga := A[i].harga;
			end;
		end;
		
		{ Seleksi sesuai ukuran }
		q:=0;
		for i := 1 to p do
		begin
			case upcase(u) of
			'S' : begin
					if B[i].S>0 then
					begin
						q := q+1;
						A[q].nama := B[i].nama;
						A[q].kategori := B[i].kategori;
						A[q].warna := B[i].warna;
						A[q].S := B[i].S;
						A[q].M := B[i].M;
						A[q].L := B[i].L;
						A[q].XL := B[i].XL;
						A[q].harga := B[i].harga;
					end;
				  end;
			'M' : begin
					if B[i].M>0 then
					begin
						q := q+1;
						A[q].nama := B[i].nama;
						A[q].kategori := B[i].kategori;
						A[q].warna := B[i].warna;
						A[q].S := B[i].S;
						A[q].M := B[i].M;
						A[q].L := B[i].L;
						A[q].XL := B[i].XL;
						A[q].harga := B[i].harga;
					end;
				  end;
			'L' : begin
					if B[i].L>0 then
					begin
						q := q+1;
						A[q].nama := B[i].nama;
						A[q].kategori := B[i].kategori;
						A[q].warna := B[i].warna;
						A[q].S := B[i].S;
						A[q].M := B[i].M;
						A[q].L := B[i].L;
						A[q].XL := B[i].XL;
						A[q].harga := B[i].harga;
					end;
				  end; 
			'XL': begin
					if B[i].XL>0 then
					begin
						q := q+1;
						A[q].nama := B[i].nama;
						A[q].kategori := B[i].kategori;
						A[q].warna := B[i].warna;
						A[q].S := B[i].S;
						A[q].M := B[i].M;
						A[q].L := B[i].L;
						A[q].XL := B[i].XL;
						A[q].harga := B[i].harga;
					end;
				  end;
			'SEMUA' : begin
						q := q+1;
						A[q].nama := B[i].nama;
						A[q].kategori := B[i].kategori;
						A[q].warna := B[i].warna;
						A[q].S := B[i].S;
						A[q].M := B[i].M;
						A[q].L := B[i].L;
						A[q].XL := B[i].XL;
						A[q].harga := B[i].harga;
					  end;
			'' : begin
					q := q+1;
					A[q].nama := B[i].nama;
					A[q].kategori := B[i].kategori;
					A[q].warna := B[i].warna;
					A[q].S := B[i].S;
					A[q].M := B[i].M;
					A[q].L := B[i].L;
					A[q].XL := B[i].XL;
					A[q].harga := B[i].harga;
				 end;
			end;
		end;
		
		{ Seleksi sesuai warna }
		p:=0;
		for i := 1 to q do
		begin
			if (lowercase(w) = lowercase(A[i].warna)) or (lowercase(w) = 'semua') or (w = '') then
			begin
				p := p+1;
				B[p].nama := A[i].nama;
				B[p].kategori := A[i].kategori;
				B[p].warna := A[i].warna;
				B[p].S := A[i].S;
				B[p].M := A[i].M;
				B[p].L := A[i].L;
				B[p].XL := A[i].XL;
				B[p].harga := A[i].harga;
			end;
		end;
		
		{ Hasil akhir disimpan dalam array B }
		{ Menampilkan hasil }
		{ Array.kategori tidak ditampilkan }
		{ Jika p=0, berarti tidak ada barang yang lolos seleksi }
		if (p=0) then
		begin
			writeln ('> Barang tidak ditemukan');
		end else {p>0}
		begin
			for j := 1 to p do
			begin
				write ('> ',j,'. ');
				writeln (B[j].nama);
				writeln ('  warna : ',B[j].warna);
				writeln ('  S: ',B[j].S,' M: ',B[j].M,' L: ',B[j].L,' XL: ',B[j].XL);
				writeln ('  Rp ',B[j].harga:0:2);
				writeln;
			end;
		end;
	end;
	
	procedure filterByPrice (T:ArrayOfStok; nStok:integer);
	{ menampilkan barang dengan harga paling murah dan/atau harga paling mahal, sebelum dan sesudah diskon grosir (sekali diskon grosir) }
	{ I.S. T terdefinisi. urut sebarang }
	{ F.S. menampilkan barang termurah dan termahal }
	{kamus}
	type
		maks = record
			nama : string;
			harga : real;
		end;
		tab = array [1..5] of maks;
	var
		i : integer;
		a,b,c,d : integer; 	{ neff dari tiap variabel }
		max, min : tab;
		maxdiskon, mindiskon : tab;
	{algoritma}	
	begin
		a:=1; b:=1; c:=1; d:=1;
		{ inisialisasi awal barang termahal dan termurah}
		max[a].harga := T[1].Harga;
		max[a].nama := T[1].Nama;
		min[b].harga := T[1].Harga;
		min[b].nama := T[1].Nama;
		maxdiskon[c].harga := T[1].Harga;
		maxdiskon[c].nama := T[1].Nama;
		mindiskon[d].harga := T[1].Harga;
		mindiskon[d].nama := T[1].Nama;

		{ cari harga normal termahal }
		for i := 2 to nStok do
		begin
			if (T[i].Harga > max[a].harga) then
			begin
				a := 1;
				max[a].harga := T[i].Harga;
				max[a].nama := T[i].Nama;
			end else
			if (T[i].Harga = max[a].harga) then	{ Jika produk dengan harga termahal ada lebih dari satu }
			begin
				a := a+1;
				max[a].harga := T[i].Harga;
				max[a].nama := T[i].Nama;
			end;
		end;
		
		{ cari harga normal termurah }
		for i := 2 to nStok do
		begin
			if (T[i].Harga < min[b].harga) then
			begin
				b := 1;
				min[b].harga := T[i].Harga;
				min[b].nama := T[i].Nama;
			end else
			if (T[i].Harga = min[b].harga) then	{ Jika produk dengan harga termurah ada lebih dari satu }
			begin
				b := b+1;
				min[b].harga := T[i].Harga;
				min[b].nama := T[i].Nama;
			end;
		end;	
		
		{ cari harga setelah diskon grosir termahal }
		for i := 2 to nStok do
		begin
			if T[i].Diskon>0 then 	{ ada diskon grosir }
			begin
				if (T[i].Harga*(1-T[i].Diskon*0.01)) > (maxdiskon[c].harga) then
				begin
					c := 1;
					maxdiskon[c].harga := T[i].Harga*(1-T[i].Diskon*0.01);
					maxdiskon[c].nama := T[i].Nama;
				end else
				if (T[i].Harga*T[i].Diskon) = (maxdiskon[c].harga) then	{ Jika produk dengan harga termahal setelah diskon ada lebih dari satu }
				begin
					c := c+1;
					maxdiskon[c].harga := T[i].Harga*(1-T[i].Diskon*0.01);
					maxdiskon[c].nama := T[i].Nama;
				end;
			end else
			{ Jika tidak ada diskon (diskonGrosir=0) }
			if (T[i].Harga > maxdiskon[c].harga) then
			begin
				c := 1;
				maxdiskon[c].harga := T[i].Harga;
				maxdiskon[c].nama := T[i].Nama;
			end else
			if (T[i].Harga = maxdiskon[c].harga) then	{ Jika produk dengan harga termahal setelah diskon ada lebih dari satu }
			begin
				c := c+1;
				maxdiskon[c].harga := T[i].Harga;
				maxdiskon[c].nama := T[i].Nama;
			end;		
		end;
		
		{ cari harga setelah diskon grosir termurah }	
		for i := 2 to nStok do
		begin
			if T[i].Diskon>0 then 	{ ada diskon grosir }
			begin
				if (T[i].Harga*(1-T[i].Diskon*0.01)) < (mindiskon[d].harga) then
				begin
					d := 1;
					mindiskon[d].harga := T[i].Harga*(1-T[i].Diskon*0.01);
					mindiskon[d].nama := T[i].Nama;
				end else
				if (T[i].Harga*(1-T[i].Diskon*0.01)) = (mindiskon[d].harga) then	{ Jika produk dengan harga termurah setelah diskon ada lebih dari satu }
				begin
					d := d+1;
					mindiskon[d].harga := T[i].Harga*(1-T[i].Diskon*0.01);
					mindiskon[d].nama := T[i].Nama;
				end;
			end else
			{ Jika tidak ada diskon (diskonGrosir=0) }
			if (T[i].Harga < mindiskon[d].harga) then
			begin
				d := 1;
				mindiskon[d].harga := T[i].Harga;
				mindiskon[d].nama := T[i].Nama;
			end else
			if (T[i].Harga = mindiskon[d].harga) then	{ Jika produk dengan harga termurah setelah diskon ada lebih dari satu }
			begin
				d := d+1;
				mindiskon[d].harga := T[i].Harga;
				mindiskon[d].nama := T[i].Nama;
			end;		
		end;
		
		{ Menampilkan hasil filterByPrice }
		if (a = 1) then
		begin
			writeln ('> Termahal : ',max[a].nama);
			writeln ('             Rp ',max[a].harga:0:2);
		end else  { produk dengan harga termahal ada lebih dari 1 }
		begin
			write ('> Termahal : ');
			for i := 1 to a do
			begin
				writeln ('  ',max[a].nama);
			end;
			writeln ('  ',max[a].harga);
		end;
		
		if (b = 1) then
		begin
			writeln ('> Termurah : ',min[b].nama);
			writeln ('             Rp ',min[b].harga:0:2);
		end else  { produk dengan harga termurah ada lebih dari 1 }
		begin
			write ('> Termurah : ');
			for i := 1 to b do
			begin
				writeln ('  ',min[b].nama);
			end;
			writeln ('  ',min[b].harga:0:2);
		end;

		if (c = 1) then
		begin
			writeln ('> Termahal setelah sekali diskon grosir : ',maxdiskon[c].nama);
			writeln ('                                          Rp ',maxdiskon[c].harga:0:2);
		end else  { produk dengan harga termahal setelah diskon grosir ada lebih dari 1 }
		begin
			write ('> Termahal setelah sekali diskon grosir : ');
			for i := 1 to c do
			begin
				writeln ('  ',maxdiskon[c].nama);
			end;
			writeln ('  ',maxdiskon[c].harga:0:2);
		end;
		
		if (d = 1) then
		begin	
		writeln ('> Termurah setelah sekali diskon grosir : ',mindiskon[d].nama);
		writeln ('                                          Rp ',mindiskon[d].harga:0:2);
			end else  { produk dengan harga termurah setelah diskon grosir ada lebih dari 1 }
		begin
			write ('> Termurah setelah sekali diskon grosir : ');
			for i := 1 to d do
			begin
				writeln ('  ',mindiskon[d].nama);
			end;
			writeln ('  ',mindiskon[d].harga:0:2);
		end;	
	end;	
	
	procedure retur(T:ArrayOfTransaksi; S:ArrayOfStok; nTransaksi:integer);
	{Melakukan retur/pengembalian barang cacat}
	{I.S. S dan T terdefinisi}
	{F.S. Menampilkan harga yang dikembalikan bila selisih hari < 14}
	{kamus}
	var
		i : integer;
		j : integer; {indeks barang yang diretur pada array cart}
		nama : string;
		pengembalian : string;
		t1, t2 : tanggal;
		found:Boolean;
		tanggalpesan:string;
		x:integer;
	{algoritma}
	begin
		write('> Nama Barang yang dikembalikan : ');
		readln(nama);
		write('> Tanggal pengembalian (dd/mm/yyyy) : ');
		readln(pengembalian);
		write('> Tanggal pemesanan barang (dd/mm/yyyy) : ');
		readln(tanggalpesan);
		write('> Jumlah barang yang cacat : ');
		readln(x);
		StringToTanggal (pengembalian,t2);
		StringToTanggal (tanggalpesan, t1);
		found:=False;
		for i := 1 to nTransaksi do
			if (lowercase(nama) = lowercase(T[i].NamaBaju)) and (t1.d=T[i].TanggalKirim.d) and (t1.m=T[i].TanggalKirim.m) and (t1.y=T[i].TanggalKirim.y) and (x<(T[i].UkuranS + T[i].UkuranM + T[i].UkuranL + T[i].UkuranXL))then
			begin
				j := i;
				TambahTanggal(T[i].LamaPengiriman,t1);
				found:=true;
			end;
	
		if (found) then 
		begin
			if (SelisihTanggal(t1,t2)) <= 14  then
			begin
				writeln('> Pengembalian diterima');		//mengembalikan senilai uang harga baju dikali jumlah baju
				writeln('> Rp ', (T[j].Harga * x {Harga barang} 
				+ T[j].Biaya * (round(trunc(T[j].Berat*x)+0.51)) {harga pengiriman} 
				, ' dikembalikan');		
			end else
			begin
				writeln('> Melebihi batas waktu, pengembalian ditolak' );
			end;
		end else
			writeln('Terjadi kesalahan dalam input pengguna (cek nama barang, tanggal pembelian, dan jumlah barang apakah sudah sesuai atau belum) ');
	end;
	procedure tukar (var a,b:transaksi);
	{I.S. a dan b terdefinisi}
	{F.S. a dan b ditukar nilainya}
	{KAMUS LOKAL}
	var
		temp:transaksi;
	{ALORITMA}
	begin
		temp:=a;
		a:=b;
		b:=temp;
	end;

	procedure SortTanggalKirim(T1:ArrayOfTransaksi;Ntransaksi:integer ;var T2:ArrayOfTransaksi);
	{I.S. T1 dan Ntransaksi terdefinisi}
	{F.S. T2 terisi dengan tanggal kirim terurut menurun}
	{KAMUS LOKAL}
	var
	i,j:integer;
	temp:transaksi;
	Ttemp:ArrayOfTransaksi;
	{ALGORITMA}
	begin
		Ttemp:=T1;
		for i:=1 to Ntransaksi do
		begin

			temp:=Ttemp[i];
			for j:=i+1 to Ntransaksi do
			begin
					if (Ttemp[j].TanggalKirim.y) > (temp.TanggalKirim.y) then
					begin
						temp:=Ttemp[j];
						tukar(Ttemp[i],Ttemp[j]);
					end else if (Ttemp[j].TanggalKirim.y) = (temp.TanggalKirim.y) then
					begin
						if (Ttemp[j].TanggalKirim.m) > (temp.TanggalKirim.m) then
						begin
							temp:=Ttemp[j];
							tukar(Ttemp[i],Ttemp[j]);
						end else if (Ttemp[j].TanggalKirim.m) = (temp.TanggalKirim.m) then
						begin
							if (Ttemp[j].TanggalKirim.d) >= (temp.TanggalKirim.d) then
							begin
								temp:=Ttemp[j];
								tukar(Ttemp[i],Ttemp[j]);
							end;
						end;
					end;

			end;
			T2[i]:=temp;
		end;
	end;
	
	procedure ShowTransaction(T1:ArrayOfTransaksi;Ntransaksi:integer);
	{I.S. T1 dan Ntransaksi terdefinisi}
	{F.S. transaksi berdasarkan urutan tanggal dituliskan ke layar}
	{KAMUS LOKAL}
	var
	T2:ArrayOfTransaksi;
	i:integer;
	{ALGORITMA}
	begin
		SortTanggalKirim(T1,Ntransaksi,T2);
		for i:=1 to Ntransaksi do
		begin
			with T2[i] do
			begin
				write(NamaBaju);
				write(' | ', Warna);
				write(' | ', Berat:0:2);
				write(' | ', Bahan);
				write(' | ', Harga);
				write(' | ', UkuranS);
				write(' | ', UkuranM);
				write(' | ', UkuranL);
				write(' | ', UkuranXl);
				write(' | ', NamaEkspedisi);
				write(' | ', JenisLayanan);
				write(' | ', KotaTujuan);
				write(' | ', Biaya);
				write(' | ', LamaPengiriman);
				writeln(' | ', TanggalKirim.d,'/',TanggalKirim.m,'/',TanggalKirim.y);
			end;
		end;
	end;	

	procedure addToCart (var T:ArrayOfStok; var C:ArrayOfCart; nStok:integer; var nCart:integer);
	{ Menuliskan barang pesanan ke dalam file eksternal }
	{ Jumlah barang yang dipesan tidak boleh lebih besar dari dari stok yang tersedia }
	{ Program akan menampilkan pesan jika jumlah pesanan lebih besar dari stok yang ada }
	{ I.S. T, C, nCart dan nStok terdefinisi }
	{ F.S. C terisi barang pesanan }
	{kamus}
	var
		i, j : integer;
		nm, u : string;
		jumlah : integer;
		found : boolean;	{bernilai true bila nama baju yang di addToCart sudah ada di Cart}
		cukup : boolean;	{bernilai true bila stok mencukupi pembelian}
	{algoritma}
	begin
		write ('> Nama produk : '); 
		readln(nm);
		write ('> Ukuran : ');
		readln (u);
		write ('> Jumlah : ');
		readln (jumlah);
		found := false;
		cukup := true;
		{ Pertama, akan di cek di array cart apakah produk yang ingin dibeli sudah pernah dipilih atau belum. Jika sudah, maka program akan
		  menambahkan jumlah beli di array cart. Jumlah beli = jumlah baju yang dibeli }

		for i:=1 to nCart do
		begin
			if (lowercase(nm) = lowercase(C[i].Nama)) then
			begin
				found := true;
				for j:=1 to nStok do
				begin
					case upcase(u) of 
						'S' : begin
								if (lowercase(nm) = lowercase(T[j].Nama)) then
								begin
									if (jumlah<=T[j].UkuranS) then
									begin
										C[i].JumlahBeliS := C[i].JumlahBeliS + jumlah;
									end
									else
									begin
										writeln ('> Maaf, stok kami tidak mencukupi');
										cukup := false;
									end;	
								end;
							  end;
						'M' : begin
								if (lowercase(nm) = lowercase(T[j].Nama)) then
								begin
									if (jumlah<=T[j].UkuranM) then
									begin
										C[i].JumlahBeliM := C[i].JumlahBeliM + jumlah;
									end
									else
									begin
										writeln ('> Maaf, stok kami tidak mencukupi');
										cukup := false;
									end;
								end;
							  end;
						'L' : begin
								if (lowercase(nm) = lowercase(T[j].Nama)) then
								begin
									if (jumlah<=T[j].UkuranL) then
									begin
										C[i].JumlahBeliL := C[i].JumlahBeliL + jumlah;
									end
									else
									begin
										writeln ('> Maaf, stok kami tidak mencukupi');
										cukup := false;
									end;
								end;
							  end;
						'XL' : begin
								if (lowercase(nm) = lowercase(T[j].Nama)) then
								begin
									if (jumlah<=T[j].UkuranXL) then
									begin
										C[i].JumlahBeliXL := C[i].JumlahBeliXL + jumlah;
									end
									else
									begin
										writeln ('> Maaf, stok kami tidak mencukupi');
										cukup := false;
									end;
								end;
							  end;
						else
						begin
							writeln('Input ukuran salah');
							cukup := false
						end;
					end;
				end;
			end;
		end;
		{ Jika produk yang ingin dibeli tidak ada di array cart, berarti produk tersebut belum pernah dipilih, maka produk tersebut akan
		  dicari di array stok }
		if not(found) then
		begin
			for j:= 1 to nStok do
			begin
				if (lowercase(nm) = lowercase(T[j].Nama)) then
				begin
					found := true;
					case upcase(u) of
						'S' : begin
								if jumlah<=T[j].UkuranS then
								begin
									{ memasukkan data baju yang dibeli ke array cart }
									C[nCart+1].Nama := T[j].Nama;
									C[nCart+1].Warna := T[j].Warna;
									C[nCart+1].Berat := T[j].Berat;
									C[nCart+1].Bahan := T[j].Bahan;
									C[nCart+1].Harga := T[j].Harga;
									C[nCart+1].JumlahBeliS := C[j].JumlahBeliS + jumlah;
									nCart := nCart+1;
								end else  
								begin
									writeln ('> Maaf, stok kami tidak mencukupi');
									cukup := false;
								end;
							  end;
						'M' : begin
								if jumlah<=T[j].UkuranM then
								begin
									{ memasukkan data baju yang dibeli ke array cart }
									C[nCart+1].Nama := T[j].Nama;
									C[nCart+1].Warna := T[j].Warna;
									C[nCart+1].Berat := T[j].Berat;
									C[nCart+1].Bahan := T[j].Bahan;
									C[nCart+1].Harga := T[j].Harga;
									C[nCart+1].JumlahBeliM := C[j].JumlahBeliM + jumlah;
									nCart := nCart + 1;
								end else  
								begin
									writeln ('> Maaf, stok kami tidak mencukupi');
									cukup := false;
								end;
							  end;
						'L' : begin
								if jumlah<=T[j].UkuranL then
								begin
									{ memasukkan data baju yang dibeli ke array cart }
									C[nCart+1].Nama := T[j].Nama;
									C[nCart+1].Warna := T[j].Warna;
									C[nCart+1].Berat := T[j].Berat;
									C[nCart+1].Bahan := T[j].Bahan;
									C[nCart+1].Harga := T[j].Harga;
									C[nCart+1].JumlahBeliL := C[j].JumlahBeliL + jumlah;
									nCart := nCart + 1;
								end else  
								begin
									writeln ('> Maaf, stok kami tidak mencukupi');
									cukup := false;
								end;
							  end;
						'XL' : begin
								if jumlah<=T[j].UkuranXL then
								begin
									{ memasukkan data baju yang dibeli ke array cart }
									C[nCart+1].Nama := T[j].Nama;
									C[nCart+1].Warna := T[j].Warna;
									C[nCart+1].Berat := T[j].Berat;
									C[nCart+1].Bahan := T[j].Bahan;
									C[nCart+1].Harga := T[j].Harga;
									C[nCart+1].JumlahBeliXL := C[j].JumlahBeliXL + jumlah;
									nCart := nCart + 1;
								end else  
								begin
									writeln ('> Maaf, stok kami tidak mencukupi');
									cukup := false;
								end;
							  end;
						else
						begin
							writeln('Input ukuran salah');
							cukup := false
						end;
					end;
				end;
			end;
			if not(found) then
				writeln ('> Keyword yang Anda masukkan salah');
		end;
		if found and cukup then
			writeln('> Berhasil ditambahkan ke dalam cart');
	end;	

	procedure removeFromCart (var T:ArrayOfStok; var C:ArrayOfCart; nStok:integer; var nCart:integer);
	{ mnghapuskan pesanan yagn dipilih pengguna dari Cart }
	{ I.S. T, C, nStok, dan nCart terdefinisi }
	{ F.S. C akan berisi barang pesanan sudah diperbaharui }
	{kamus}
	var
		i, j : integer;
		nm, u : string;
		jumlah : integer;
		CTemp : ArrayOfCart; {variabel sementara}
		pil : char;
		found : boolean; {bernilai true saat ditemukan kecocokan pada cart}
		k : integer; { sebagai variabel nCart baru }
	{algoritma}
	begin
		write ('> Nama produk : '); readln (nm);
		write ('> Ukuran : '); readln (u);
		write ('> Jumlah : '); readln (jumlah);
		k:=0;
		for i := 1 to nCart do
		begin
			if (lowercase(nm) = lowercase(C[i].Nama)) then
			begin
				found := true;
				case upcase(u) of
					'S' : begin
							if jumlah<=C[i].JumlahBeliS then
							begin
								for j := 1 to nStok do
								begin
									if (lowercase(nm) = lowercase(T[j].Nama)) then
									begin
										C[i].JumlahBeliS := C[i].JumlahBeliS - jumlah; { jumlah barang di cart berkurang }
									end;
								end;
							end else { jumlah > jumlah beli }
							begin
								writeln ('> Maaf, data yang anda masukkan lebih besar dari jumlah pembelian awal.');
								write ('  Apakah Anda ingin membatalkan seluruh pembelian ukuran S dari produk ini? (y/t)');
								readln (pil);
								if (pil = 'y') or (pil = 'Y') then
								begin
									for j := 1 to nStok do
									begin
										if (lowercase(nm) = lowercase(T[j].Nama)) then
										begin
											C[i].JumlahBeliS := 0;
										end;
									end;
								end else
								if (pil = 't') or (pil = 'T') then
								begin
									writeln ('> Data yang Anda masukkan salah. Silakan ulangi perintah');
								end;
							end;
						  end;
					'M' : begin
							if jumlah<=C[i].JumlahBeliM then
							begin
								for j := 1 to nStok do
								begin
									if (lowercase(nm) = lowercase(T[j].Nama)) then
									begin
										C[i].JumlahBeliM := C[i].JumlahBeliM - jumlah; { jumlah barang di cart berkurang }
									end;
								end;
							end else { jumlah > jumlah beli }
							begin
								writeln ('> Maaf, data yang anda masukkan lebih besar dari jumlah pembelian awal.');
								write ('  Apakah Anda ingin membatalkan seluruh pembelian ukuran M dari produk ini? (y/t)'); readln (pil);
								if (pil = 'y') or (pil = 'Y') then
								begin
									for j := 1 to nStok do
									begin
										if (lowercase(nm) = lowercase(T[j].Nama)) then
										begin
											C[i].JumlahBeliM := 0;
										end;
									end;
								end else
								if (pil = 't') or (pil = 'T') then
								begin
									writeln ('> Data yang Anda masukkan salah. Silakan ulangi perintah');
								end;
							end;
						  end;
					'L' : begin
							if jumlah<=C[i].JumlahBeliL then
							begin
								for j := 1 to nStok do
								begin
									if (lowercase(nm) = lowercase(T[j].Nama)) then
									begin
										C[i].JumlahBeliL := C[i].JumlahBeliL - jumlah; { jumlah barang di cart berkurang }
									end;
								end;
							end else { jumlah > jumlah beli }
							begin
								writeln ('> Maaf, data yang anda masukkan lebih besar dari jumlah pembelian awal.');
								write ('  Apakah Anda ingin membatalkan seluruh pembelian ukuran L dari produk ini? (y/t)'); readln (pil);
								if (pil = 'y') or (pil = 'Y') then
								begin
									for j := 1 to nStok do
									begin
										if lowercase(nm) = lowercase(T[j].Nama) then
										begin
											C[i].JumlahBeliL := 0;
										end;
									end;
								end else
								if (pil = 't') or (pil = 'T') then
								begin
									writeln ('> Data yang Anda masukkan salah. Silakan ulangi perintah');
								end;
							end;
						  end;
					'XL' : begin
							if jumlah<=C[i].JumlahBeliXL then
							begin
								for j := 1 to nStok do
								begin
									if (lowercase(nm) = lowercase(T[j].Nama)) then
									begin
										C[i].JumlahBeliXL := C[i].JumlahBeliXL - jumlah; { jumlah barang di cart berkurang }
									end;
								end;
							end else { jumlah > jumlah beli }
							begin
								writeln ('> Maaf, data yang anda masukkan lebih besar dari jumlah pembelian awal.');
								write ('  Apakah Anda ingin membatalkan seluruh pembelian ukuran XL dari produk ini? (y/t)'); readln (pil);
								if (pil = 'y') or (pil = 'Y') then
								begin
									for j := 1 to nStok do
									begin
										if lowercase(nm) = lowercase(T[j].Nama) then
										begin
											C[i].JumlahBeliXL := 0;
										end;
									end;
								end else
								if (pil = 't') or (pil = 'T') then
								begin
									writeln ('> Data yang Anda masukkan salah. Silakan ulangi perintah');
								end;
							end;
						  end;
					else
					begin
						writeln('Ukuran yang diinput salah');
					end;
				end;
			end;
		end;
		if not(found) then
			writeln ('> Nama yang Anda masukkan tidak ditemukan');
		
		{cek kekosongan produk dalam cart, dan mengisi produk yang masih ada ke array sementara}
		for i := 1 to nCart do
		begin
			if (C[i].JumlahBeliS + C[i].JumlahBeliM + C[i].JumlahBeliL + C[i].JumlahBeliXL) > 0 then
			begin
				k := k + 1;
				CTemp[k] := C[i];
			end;
		end;
		
		{mengisi array cart dengan array sementara}
		for i := 1 to k do
			C[i] := CTemp[i];
		
		nCart := k;		
	end;

	procedure calculatePriceCart (C:ArrayOfCart; nCart:integer; diskon:ArrayOfInteger ; var beratcart:real; var hargacart:real);
	{menghitung harga total barang-barang dalam cart}
	{I.S. C, nCart, DataStok, dan nStok terdefinisi}
	{F.S. beratcart dan hargacart akan diisi nilainya}
	{kamus}
	var
		i : integer;
		jumlah : integer;	{ jumlah baju S,M,L, dan XL yang dibeli }
	{algoritma}
	begin
		beratcart := 0;
		hargacart := 0;
		{ Menampilkan isi shopping cart dan menghitung total harga dan berat }
		for i := 1 to nCart do
		begin
			jumlah := C[i].JumlahBeliS + C[i].JumlahBeliM + C[i].JumlahBeliL + C[i].JumlahBeliXL;
			beratcart := beratcart + (C[i].Berat*jumlah);
			writeln ('> ',i,'. Nama	: ',C[i].Nama);
			writeln ('  Warna : ',C[i].Warna);
			writeln ('  Berat : ',C[i].Berat:0:2, ' kg');
			writeln ('  Bahan : ',C[i].Bahan);
			writeln ('  Harga : Rp ',C[i].Harga);
			writeln ('  Jumlah Beli Ukuran S : ',C[i].JumlahBeliS);
			writeln ('  Jumlah Beli Ukuran M : ',C[i].JumlahBeliM);
			writeln ('  Jumlah Beli Ukuran L : ',C[i].JumlahBeliL);
			writeln ('  Jumlah Beli Ukuran XL : ',C[i].JumlahBeliXL);
			writeln ('  Diskon Grosir : ',diskon[i], '%');
			writeln('  Rp ', C[i].Harga, ' x ', jumlah, ' = ', C[i].Harga*jumlah);
			writeln ('  ');

			{ Menghitung total harga }
			if (diskon[i] > 0) then
			begin
				hargacart := hargacart + ((C[i].Harga*jumlah)*(1-diskon[i]*0.01));	{di sini ada masalah}
			end else { diskon = 0 }
				hargacart := hargacart + (C[i].Harga*jumlah);
		end;	
	end;

	procedure checkout(var DataStok:ArrayOfStok; DataEkspedisi:ArrayOfEkspedisi; var DataCart:ArrayOfCart; var DataTransaksi:ArrayOfTransaksi; nStok, nEkspedisi:integer; var nTransaksi,nCart:integer );
	{melakukan checkout barang, mengosongkan cart, menambahkan data pada array transaksi}
	{I.S. DataStok, DataEkspedisi, DataCart, DataTransaksi, nStok, nTransaksi, dan nCart terdefinisi}
	{F.S. menampilkan harga total, mengosongkan array cart, menambah entri pada array transaksi, mengupdate jumlah barang di array stok}
	{kamus}
	var
		t,t1:tanggal;
		BeratCart:real;
		HargaCart:real;
		kota,ekspedisi,jenislayanan,tanggalkirim:string;
		hargatotal:real;
		i,j:integer;
		found:boolean;
		BiayaEkspedisi:longint;
		LamaEkspedisi:integer;
		diskon:ArrayOfInteger;
	{algoritma}
	begin
		repeat
		begin
			write('> Kota Tujuan Pengirim : ');readln(kota); // Membaca kota tujuan barang yang akan dikirim
			write('> Nama Ekspedisi : ');readln(ekspedisi); // Membaca nama ekspedisi yang akan dipakai
			write('> Jenis Layanan : ');readln(jenislayanan); // Membaca jenis layanan apakah kilat atau tidak 
			for i := 1 to nEkspedisi do
			begin
				if (lowercase(kota)=lowercase(DataEkspedisi[i].KotaTujuan)) and (lowercase(ekspedisi)=lowercase(DataEkspedisi[i].Nama)) 
				and (lowercase(jenislayanan) = lowercase(DataEkspedisi[i].JenisLayanan)) then
				begin
					
						
					BiayaEkspedisi:=DataEkspedisi[i].Biaya;
					LamaEkspedisi:=DataEkspedisi[i].LamaPengiriman;
					found := true;
				
				end;
			end;
			if found = false then
				writeln('> Maaf, tidak ditemukan pilihan ekspedisi tersebut');
		end;
		until found = true;
		write('> Tanggal Kirim (dd/mm/yyyy) : ');readln(tanggalkirim); //
		StringToTanggal(tanggalkirim,t);
		t1:=t;
		discountGrosir (DataCart,DataStok,nCart,nStok,diskon);
		calculatePriceCart (DataCart,nCart,diskon,BeratCart,HargaCart);
		HargaTotal := HargaCart + (BiayaEkspedisi * (round(trunc(BeratCart)+0.51)));
		writeln('> Harga total yang harus dibayarkan = Rp ',HargaTotal:0:2);
		TambahTanggal(LamaEkspedisi,t1);
		
		i:=nTransaksi+1;
		j:=1;
		while (i<=nTransaksi+nCart) or (j<=nCart) do
		begin
			DataTransaksi[i].NamaBaju:=DataCart[j].Nama;
			DataTransaksi[i].Warna:=DataCart[j].Warna;
			DataTransaksi[i].Berat:=DataCart[j].Berat;
			DataTransaksi[i].Bahan:=DataCart[j].Bahan;
			DataTransaksi[i].Harga:=DataCart[j].Harga;
			DataTransaksi[i].UkuranS:=DataCart[j].JumlahBeliS;
			DataTransaksi[i].UkuranM:=DataCart[j].JumlahBeliM;
			DataTransaksi[i].UkuranL:=DataCart[j].JumlahbeliL;
			DataTransaksi[i].UkuranXL:=DataCart[j].JumlahBeliXL;
			DataTransaksi[i].NamaEkspedisi:=ekspedisi;
			DataTransaksi[i].JenisLayanan:=jenislayanan;
			DataTransaksi[i].KotaTujuan:=kota;
			DataTransaksi[i].Biaya:=BiayaEkspedisi;
			DataTransaksi[i].LamaPengiriman:=LamaEkspedisi;
			DataTransaksi[i].TanggalKirim:=t;
			
			updateClothes(DataStok, DataCart, j, nStok, nCart); {mengupdate jumlah barang dalam stok}
			
			i:=i+1;
			j:=j+1;
		end; 
		nTransaksi:=nTransaksi+nCart;
		for i:=1 to nCart do
		begin
			DataCart[i].Nama:='';
			DataCart[i].Warna:='';
			DataCart[i].Berat:=0;
			DataCart[i].Bahan:='';
			DataCart[i].Harga:=0;
			DataCart[i].JumlahBeliS:=0;
			DataCart[i].JumlahBeliM:=0;
			DataCart[i].JumlahBeliL:=0;
			DataCart[i].JumlahBeliXL:=0;
		end;
			
		nCart:=0;
		writeln('> Tanggal sampai = ',t1.d,'/',t1.m,'/',t1.y);
	end;
	
	function mirip(Cat:String; warna:String; Gender:String; Bahan:String; Baju:Stok):Integer; 
	{Memberikan kuantitas kemiripan barang}
	{kamus}
	var
		count:Integer;
	{algoritma}
	begin
		count:=0;
		if Cat=Baju.Kategori then
			count:=count+1;
		if warna=Baju.Warna then
			count:=count+1;
		if Gender=Baju.Gender then
			count:=count+1;
		if Bahan=Baju.Bahan then
			count:=count+1;
		mirip := count;
	end;	
	
	procedure recommendation(ABaju:ArrayOfStok; nStok:integer; ACart:ArrayOfCart; nCart:integer);
	{memunculkan rekomendasi barang dengan acuan barang yang terakhir ditambahkan ke cart}
	{I.S ABaju, nStok, ACart, nCart terdefinisi}
	{F.S menampilkan baju rekomendasi dari penambahan cart terakhir barang}
	{Kamus}
	var
		recc 	: Stok;	//Nilai sementara untuk baju yang direkomendasikan
		i		: Integer;		//Untuk Inisialisasi
		count	: Integer;		//Variabel Lokal
		sama	: Boolean; 		//Menghasilkan true bila nama yg direkomendasi telah ada di cart
		Nama, Cat, Warna, Gender, Bahan : String; //nilai untuk dibandingkan
	{algoritma}
	begin
		Nama := ACart[nCart].Nama;	//Mengisi nilai untuk dicari rekomendasinya/kemiripannya
		for i:=1 to nStok do
		begin
			if Nama = ABaju[i].Nama then
			begin
				Cat := ABaju[i].Kategori;
				Warna := ABaju[i].Warna;
				Gender := ABaju[i].Gender;
				Bahan := ABaju[i].Bahan;
			end;
		end;
	
		count:=0; //Inisialisasi
		for i:=1 to nStok do	// Cari kecocokan preferensi pembeli dengan stok
		begin
			if (Nama=ABaju[i].Nama) then 
				sama := true
			else 
				sama := false;
				
			if (count <= mirip(Cat, Warna, Gender, Bahan, ABaju[i])) and not(sama) and (Gender = ABaju[i].Gender) then
			begin
				count := mirip(Cat, Warna, Gender, Bahan, ABaju[i]);
				recc := ABaju[i];
			end;	
		end;
		
		// Cetak rekomendasi
		if count > 0 then
		begin
			writeln('> Mungkin anda akan tertarik dengan');
			writeln('  ', recc.Nama);
			writeln('  Kategori : ', recc.Kategori);
			writeln('  Gender : ', recc.Gender);
			writeln('  Warna : ', recc.Warna);
			writeln('  Bahan : ', recc.Bahan);
			writeln('  Rp ', recc.Harga);
		end;
	end;
	
end.
