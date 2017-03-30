unit uFuncoes;

interface
uses Windows, System.IniFiles, System.SysUtils;

    procedure setIni(lcIni, lcSessao, lcSubSessao, lcValor: string);
    procedure Inc (var numero: Integer);
    procedure Dec (var numero: Integer);

    function getMemoriaFisica: Integer;
    function getMemoriaFisicaMb: Integer;
    function getSO: String;
    function getIni(lcIni, lcSessao, lcSubSessao: string): string;
    Function testacpf(cpf:string):boolean;

implementation

function getMemoriaFisica: Integer;
  var
    loMemoryStatus :TMemoryStatus;
begin
    loMemoryStatus.dwLength := SizeOf(loMemoryStatus);
    GlobalMemoryStatus(loMemoryStatus);
    Result := loMemoryStatus.dwAvailPhys;
end;

function getMemoriaFisicaMb: Integer;
begin
    Result := getMemoriaFisica div 1024;
    Result := Result div 2014;
end;

function getSO: string;
  var
    loInfo :TOSVersionInfo;
begin
   loInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);

   if GetVersionEx(loInfo) then
   begin
      if loInfo.dwPlatformId = VER_PLATFORM_WIN32s  then
        Result := 'Windows 95'
      else
        if loInfo.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
          Result := 'Windows 95 sor2 / 98'
        else
          Result := 'Windows NT';
   end
    else
      Result:= '';
end;

procedure setIni(lcIni, lcSessao, lcSubSessao, lcValor: string);
var
  loIni : TIniFile;
begin
   loIni := TIniFile.Create(lcIni);
   try
      loIni.WriteString(lcSessao, lcSubSessao, lcValor);
   finally
      loIni.Free;
   end;
end;

function getIni(lcIni, lcSessao, lcSubSessao: string): string;
var
  loIni : TIniFile;
begin
   loIni := TIniFile.Create(lcIni);
   try
      Result := loIni.ReadString(lcSessao, lcSubSessao, '');
   finally
      loIni.Free;
   end;
end;

procedure Inc (var numero: Integer);
begin
    numero := numero + 1;
end;

procedure Dec (var numero: Integer);
begin
    numero := numero - 1;
end;


Function testacpf(cpf:string):boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
begin
    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf é repetido como 111.111.111-11
    Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1);

   //testar se o cpf é repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf é composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1°*2+2°*3+3°*4.. até 9°*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1° digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1°*2+2°*3+3°*4.. até 10°*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2° digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar até aqui o cpf é valido
   result:=true;
end;


end.
