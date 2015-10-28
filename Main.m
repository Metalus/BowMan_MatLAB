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


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
global Nivel;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)
img = imread('menu2.jpg');
axes(handles.imagem);
image(img);
axes(handles.Grafico);
set(handles.lbNivel,'String',Nivel);
% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editX_Callback(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editX as text
%        str2double(get(hObject,'String')) returns contents of editX as a double


% --- Executes during object creation, after setting all properties.
function editX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editY_Callback(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editY as text
%        str2double(get(hObject,'String')) returns contents of editY as a double


% --- Executes during object creation, after setting all properties.
function editY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function forca_Callback(hObject, eventdata, handles)
% hObject    handle to forca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of forca as text
%        str2double(get(hObject,'String')) returns contents of forca as a double


% --- Executes during object creation, after setting all properties.
function forca_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultado_Callback(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultado as text
%        str2double(get(hObject,'String')) returns contents of resultado as a double


% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btLancarFlexa.
function btLancarFlexa_Callback(hObject, eventdata, handles)
global y Fs Nivel;
sound(y, Fs);
EditX = get(handles.editX, 'String');
EditY = get(handles.editY, 'String');
Forca = get(handles.forca, 'String');

Resultado = str2num(EditX)+str2num(EditY)+str2num(Forca);
set(handles.resultado, 'String', Resultado);

    if Resultado == 20
        axes(handles.Grafico);
        grafico1();
        PontosAtuais = str2num(get(handles.lbPontos,'String')); %#ok<*ST2NM>
        set(handles.lbPontos,'String', PontosAtuais +1);
        clear PontosAtuais;
        [Dados, Hz] = audioread('aplausos.wav');
        sound(Dados, Hz);
        btLimpar_Callback(hObject, eventdata, handles);
    else
        axes(handles.Grafico);
        grafico2();
        [Dados, Hz] = audioread('Haha.wav');
        sound(Dados, Hz);
        if strcmp(get(handles.lbNivel,'String'), 'Rei da Perfeição') == 0;
        helpdlg('Pelo erro de truncamento podemos fazer isso ...', 'DICAS');
        else
            msgbox({'Você errou e se declarou o Rei da Perfeição','Mas é apenas um perdedor'},'Errou','error');
            set(handles.lbPontos,'String','0');
        end
    end




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
soundview('music.mp3')
