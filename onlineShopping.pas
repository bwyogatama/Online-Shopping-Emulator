program onlineShopping;
		{program mengoperasikan berbagai sistem online shopping}
		
uses uBajuCart, uLoadSave, uTanggal;
		
{ KAMUS }
var
	AStok, AStokSorted : ArrayOfStok;	{array berisi data dengan tipe bentukan Stok}
	AEkspedisi : ArrayOfEkspedisi;	{array berisi data dengan tipe bentukan Ekspedisi}
	ACart : ArrayOfCart; {array berisi data dengan tipe bentukan Cart}
	ATransaksi : ArrayOfTransaksi; {array berisi data dengan tipe bentukan Transaksi}
	AString : ArrayOfString;	{array untuk menyimpan nilai sementara Stok dalam string}
	i : integer;	{keperluan looping}
	nStok, nEkspedisi, nCart, nTransaksi : integer;	{banyak data}
	command : string;	{command untuk melakukan fungsi-fungsi}
	diskon : ArrayOfInteger; {berisi diskon grosir tiap barang di cart}
	stop : boolean;	{boolean untuk menghentikan proses}
	
procedure showInterface ();
{I.S. sembarang}
{F.S. menampilkan interface dan menerima command}
{algoritma}
begin
	write('> ');
	readln(command);
	case lowercase(command) of
		'showall' : for i := 1 to nStok do
							ShowDataStok(AStok[i]);
		'showallline' : for i := 1 to nStok do
							ShowDataStokV2(AStok[i]);
		'showpopulars' : showPopulars(AStok, AStokSorted, nStok);
		'showdetailproduct' : ShowDetailProduct(AStok, nStok);
		'searchclothesbykeyword' : searchClothesByKeyword(AStok, nStok);
		'sortprice' : sortPrice(AStok, AStokSorted, nStok);
		'filterclothes' : filterCLothes(AStok, nStok);
		'filterbyprice' : filterByPrice(AStok, nStok);
		'showexpedition' : showExpedition(AEkspedisi, nEkspedisi);
		'addtocart' : 	begin
							addToCart(AStok, ACart, nStok, nCart);
							writeln;
							recommendation(AStok, nStok, ACart, nCart);
							writeln;
						end;
		'removefromcart' : removeFromCart(AStok, ACart, nStok, nCart);
		'calculateprice' :	begin
								discountGrosir(ACart, AStok, nCart, nStok, diskon);
								calculatePrice(ACart, nCart, diskon);
							end;
		'checkout' : begin
						if nCart = 0 then
							writeln('> Anda tidak memiliki barang dalam cart')
						else {nCart > 0}
							checkout(AStok, AEkspedisi, ACart, ATransaksi, nStok, nEkspedisi, nTransaksi, nCart);
					 end;
		'showtransaction' : showTransaction(ATransaksi, nTransaksi);
		'retur' : retur(ATransaksi, AStok, NTransaksi);
		'exit' : stop := true;
		else writeln('Command salah');
	end;
end;
	
{ ALGORITMA }	
begin
	ReadFile('stok.txt', AString, nStok);	{mengisi AString dengan string dari file eksternal}	
	LoadStok(AString, AStok, nStok); {mengisi AStok dengan data dari AString}
	ReadFile('ekspedisi.txt', AString, nEkspedisi); {mengisi AString dengan string dari file eksternal}
	LoadEkspedisi(AString, AEkspedisi, nEkspedisi); {mengisi AEkspedisi dengan data dari AString}
	ReadFile('transaksi.txt', AString, nTransaksi);	{mengisi AString dengan string dari file eksternal}	
	LoadTransaksi(AString, ATransaksi, nTransaksi); {mengisi ATransaksi dengan data dari AString}
	ReadFile('cart.txt', AString, nCart);	{mengisi AString dengan string dari file eksternal}	
	LoadCart(AString, ACart, nCart); {mengisi ACart dengan data dari AString}
	
	if nCart > 0 then
		writeln('> Peringatan! Masih terdapat barang pada cart');
	
	stop := false;
	repeat
		showInterface;
	until stop;
	
	SaveStok(AString, AStok, nStok);
	WriteFile('stok.txt', AString, nStok);
	SaveTransaksi(AString, ATransaksi, nTransaksi);
	WriteFile('transaksi.txt', AString, nTransaksi);
	SaveCart(AString, ACart, nCart);
	WriteFile('cart.txt', AString, nCart);
	
	if nCart > 0 then
		writeln('Peringatan! Masih terdapat barang pada cart, anda belum melakukan checkout');
end.