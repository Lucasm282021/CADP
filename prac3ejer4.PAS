program prac3Ejer4;
uses
    crt;
const
	nClient= 2; {cantidad de clientes}
	costMin=3.40; {costo x minuto}
	costMb=1.35;   {costo x Mb}
type
	clien = record
		codigo:integer;
		cantLinea:integer;
	    linea : record
			nLinea:string[20];
			mincon:integer;
			mb:integer;
		end;
		totalmin:integer;
		totalMb:integer;
		costTMin:real;
		costTMb:real;
		
	end;
procedure leerLinea(var cliente:clien);{lee las lineas del cliente}
var
    i:integer;
begin
	cliente.totalmin:=0;
	cliente.totalmb:=0;
	for i:=1 to cliente.cantLinea do begin
		writeln('LINEAS DEL CLIENTE Nro ',i);
		write('Nro de linea: ');
		readln(cliente.linea.nLinea);
		write('cantidad de minutos cosumidos: ');
		readln(cliente.linea.mincon);
		cliente.totalmin:=cliente.totalmin+cliente.linea.mincon;
		write('cantidad de Mb consumidos: ');
		readln(cliente.linea.mb);
		cliente.totalMb:=cliente.totalmb+cliente.linea.mb;
	end;	
	cliente.costTMin:=cliente.totalmin*costMin;
	cliente.costTMb:=cliente.totalmb*costMb;
		
end;
Procedure leerCliente(var cliente:clien);{lee los cliente de la empresa}
begin
	writeln('CARGA DE CLIENTES');
	write('codigo de cliente: ');
	readln(cliente.codigo);
	Write('cantidad de lineas: ');
	readln(cliente.cantLinea);
	leerLinea(cliente);
end;
var
    clientes:clien;
	i:integer;
{Programa Principal}
begin
    ClrScr;
	writeln('*** FACTURACION CONPANIA TELEFONICA ****');
	for i:= 1 to nClient do begin
		leerCliente(clientes);
		ClrScr;
		writeln('Facturacion del cliente');
		writeln('- cantidad de min total consumido : ',clientes.totalmin);
		writeln('- cantidad de Mb consumidos : ',clientes.totalMb);
		writeln('- TOTAL: $',clientes.costTMin+clientes.costTMb:3:2);
		writeln('Precione una tecla para continuar....');
		readKey;
		ClrScr;
	end;
end.