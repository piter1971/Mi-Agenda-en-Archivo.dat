unit Ver_Socios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;


type
  TForm1 = class(TForm)
    Panel1: TPanel;
    VerContactos: TButton;
    Image1: TImage;
    AnyadirContactos: TButton;
    procedure VerContactosClick(Sender: TObject);
    procedure AnyadirContactosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Anyadir_Socios,ListaSocios;

{$R *.dfm}
function TotalSocios:integer;
    begin
      TotalSocios:=filesize(fichero);  //devuelve el tama�o del fichero
    end;

function BuscarSocio(NumSocio:integer;var ficha:DatosSocio):boolean;
    begin
       if((NumSocio<=TotalSocios)and(NumSocio>=0))then
       begin
         seek(fichero,NumSocio);
         read(fichero,ficha); //Leer fichero y almacenar en ficha
         BuscarSocio:=true;
       end
       else
         BuscarSocio:=false;
    end;

    procedure abrir;
    begin
       AssignFile(fichero,'Socios.dat');
       if not(FileExists('Socios.dat')) then
            rewrite(fichero)
       else
          reset(fichero); //abrir lectura y escritura
    end;

    procedure cerrar;
    begin
      closeFile(fichero);
    end;

procedure TForm1.AnyadirContactosClick(Sender: TObject);
begin
Form2.ShowModal;
end;

procedure TForm1.VerContactosClick(Sender: TObject);
var
  I,fin: Integer;
  ficha:DatosSocio;
begin
abrir;
form3.TablaConatctos.RowCount:=TotalSocios+1;
for I := 0 to TotalSocios-1 do
 begin
   seek(fichero,I);
   if buscarSocio(I,ficha) then
   begin
     form3.TablaConatctos.Cells[0,i+1]:=ficha.DNI;
     form3.TablaConatctos.Cells[1,i+1]:=ficha.Nombre;
     form3.TablaConatctos.Cells[2,i+1]:=ficha.Apellido;
     form3.TablaConatctos.Cells[3,i+1]:=ficha.Direccion;
     form3.TablaConatctos.Cells[4,i+1]:=ficha.Telefono;
     form3.TablaConatctos.Cells[5,i+1]:=ficha.CumpleAnyo;

   end
   else
    showmessage('No hay socio');
 end;
form3.showmodal();
  cerrar;

end;

end.
