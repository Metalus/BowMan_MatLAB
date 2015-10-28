function varargout = Menu(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Menu_OpeningFcn, ...
                   'gui_OutputFcn',  @Menu_OutputFcn, ...
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


% ------------------ EXECUTAR AO ABRIR O JOGO ----------------------------
function Menu_OpeningFcn(hObject, eventdata, handles, varargin)
img = imread('menu.jpg');
axes(handles.imagem)
image(img)
handles.output = hObject;
guidata(hObject, handles);
global y Fs;
[y, Fs] = audioread('botao.wav');

%-------------------------------------------------------------------------


function varargout = Menu_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% ----------------------- Cria√ß√µes ---------------------------------------
function imagem_CreateFcn(hObject, eventdata, handles)

function imagem2_CreateFcn(hObject, eventdata, handles)

function text2_CreateFcn(hObject, eventdata, handles)

function text3_CreateFcn(hObject, eventdata, handles)

function text4_CreateFcn(hObject, eventdata, handles)

function text5_CreateFcn(hObject, eventdata, handles)

% ------------------------------------------------------------------------


% -------------- Cria√ß√£o do EixoX, EixoY, For√ßa e Resultado ---------------
function editX_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editY_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function forca_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function resultado_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Grafico_CreateFcn(hObject, eventdata, handles)




% --------------------------- CALLBACKS ----------------------------------

function jogar_Callback(hObject, eventdata, handles)

global Nivel y Fs;
if(get(handles.rbNormal,'Value') ~= 0)
    Nivel = 'Normal';
elseif(get(handles.rbDificil,'Value') ~= 0)
    Nivel = 'DifÌcil';
else
    Nivel = 'Rei da PerfeiÁ„o';
end
sound(y, Fs);
close;
Main;


function fechar_Callback(hObject, eventdata, handles)
global y Fs;
close
sound(y, Fs)


% --- Executes on button press in rbNormal.
function rbNormal_Callback(hObject, eventdata, handles)
% hObject    handle to rbNormal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbNormal


% --- Executes on button press in rbDificil.
function rbDificil_Callback(hObject, eventdata, handles)
% hObject    handle to rbDificil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbDificil


% --- Executes on button press in rbRei.
function rbRei_Callback(hObject, eventdata, handles)
% hObject    handle to rbRei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbRei
