unit Ver_contactos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;


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

uses Anyadir_contactos,ListaContactos;

{$R *.dfm}
function Totalcontactos:integer;
    begin
      Totalcontactos:=filesize(fichero);  //devuelve el tamaño del fichero
    end;

function BuscarContactos(NumContactos:integer;var ficha:DatosContactos):boolean;
    begin
       if((NumContactos<=TotalContactos)and(NumContactos>=0))then
       begin
         seek(fichero,NumContactos);
         read(fichero,ficha); //Leer fichero y almacenar en ficha
         BuscarContactos:=true;
       end
       else
         BuscarContactos:=false;
    end;

    procedure abrir;
    begin
       AssignFile(fichero,'Contactos.dat');
       if not(FileExists('Contactos.dat')) then
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
  ficha:DatosContactos;
begin
abrir;
form3.TablaContactos.RowCount:=TotalContactos+1;
for I := 0 to TotalContactos-1 do
 begin
   seek(fichero,I);
   if buscarContactos(I,ficha) then
   begin
     form3.TablaContactos.Cells[0,i+1]:=ficha.DNI;
     form3.TablaContactos.Cells[1,i+1]:=ficha.Nombre;
     form3.TablaContactos.Cells[2,i+1]:=ficha.Apellido;
     form3.TablaContactos.Cells[3,i+1]:=ficha.Direccion;
     form3.TablaContactos.Cells[4,i+1]:=ficha.Telefono;
     form3.TablaContactos.Cells[5,i+1]:=ficha.CumpleAnyo;

   end
   else
    showmessage('No hay socio');
 end;
form3.showmodal();
  cerrar;

end;

end.
