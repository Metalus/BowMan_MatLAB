function varargout = Main(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


function Main_OpeningFcn(hObject, eventdata, handles, varargin)
global Nivel;
img = imread('resources\main.jpg');
axes(handles.imagem);
image(img);
axes(handles.Grafico);
set(handles.lbNivel,'String',Nivel);
handles.output = hObject;


guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;



function editX_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function editX_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editY_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editY_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function forca_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function forca_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultado_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function RunVideo(Name, axe)
obj = VideoReader(Name);
video = obj.read();
axes(axe);
fps=16.66667;
try
for i=1:max(video(1,1,1,:))
    imshow(video(:,:,:,i));
    pause(1/fps);
end
catch
end


% --- Executes on button press in btLancarFlexa.
function btLancarFlexa_Callback(hObject, eventdata, handles)
global y Fs;
sound(y, Fs);
set(handles.movies,'Visible','on');
RunVideo('resources\flecha01.avi',handles.movies);
EditX = get(handles.editX, 'String');
EditY = get(handles.editY, 'String');
Forca = get(handles.forca, 'String');


Resultado = str2num(EditX)+str2num(EditY)+str2num(Forca);
set(handles.resultado, 'String', Resultado);
RunVideo('resources\flecha02.avi',handles.movies);
    if Resultado == 20
        axes(handles.Grafico);
        grafico1();
                RunVideo('resources\flecha03.avi',handles.movies);
        PontosAtuais = str2num(get(handles.lbPontos,'String')); %#ok<*ST2NM>
        set(handles.lbPontos,'String', PontosAtuais +1);
        clear PontosAtuais;
        [Dados, Hz] = audioread('resources\aplausos.wav');
        sound(Dados, Hz);
        btLimpar_Callback(hObject, eventdata, handles);
    else
        axes(handles.Grafico);
        grafico2();
        [Dados, Hz] = audioread('resources\Haha.wav');
        sound(Dados, Hz);
        if strcmp(get(handles.lbNivel,'String'), 'Rei da Perfeição') == 0;
        helpdlg('Pelo erro de truncamento podemos fazer isso ...', 'DICAS');
        else
            msgbox({'Você errou e se declarou o Rei da Perfeição.','Mas é apenas um perdedor!'},'Errou','error');
            set(handles.lbPontos,'String','0');
        end
    end

set(handles.movies,'Visible','off');


% --- Executes on button press in btLimpar.
function btLimpar_Callback(hObject, eventdata, handles)
    set(handles.editX, 'String',  '0');
    set(handles.editY, 'String',  '0');
    set(handles.forca, 'String',  '0');
    set(handles.resultado, 'String',  '0');
global y Fs;
sound(y, Fs);


% --- Executes on button press in btSair.
function btSair_Callback(hObject, eventdata, handles)
close all;
global y Fs;
sound(y, Fs);


% --- Executes on button press in btMusica.
function btMusica_Callback(hObject, eventdata, handles)
soundview('resources\music.mp3')
