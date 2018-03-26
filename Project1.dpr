program Project1;

uses
  Vcl.Forms,
  Ver_contactos in 'Ver_contactos.pas' {Form1},
  Anyadir_Contactos in 'Anyadir_Contactos.pas' {Form2},
  ListaContactos in 'ListaContactos.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
