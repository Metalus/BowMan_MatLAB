function varargout = formiga(varargin)
% FORMIGA M-file for formiga.fig
%      FORMIGA, by itself, creates a new FORMIGA or raises the existing
%      singleton*.
%
%      H = FORMIGA returns the handle to a new FORMIGA or the handle to
%      the existing singleton*.
%
%      FORMIGA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORMIGA.M with the given input arguments.
%
%      FORMIGA('Property','Value',...) creates a new FORMIGA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before formiga_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to formiga_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help formiga

% Last Modified by GUIDE v2.5 05-Oct-2015 17:13:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @formiga_OpeningFcn, ...
                   'gui_OutputFcn',  @formiga_OutputFcn, ...
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


% --- Executes just before formiga is made visible.
function formiga_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to formiga (see VARARGIN)

% Choose default command line output for formiga
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global posx;
global posy;

global vPosx;
global vPosy;
global Index;
global Distancia;

Distancia = 0;
Index= 1;
vPosx = [0];
vPosy = [0];

posx = 0;
posy = 0;
x=linspace(0,1,20);
y=x.^2;
plot(x,y);
hold on;
plot([0],[0],'-mo','MarkerFaceColor',[0 0 0]);
hold off;
% UIWAIT makes formiga wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = formiga_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in lista.
function lista_Callback(hObject, eventdata, handles)
% hObject    handle to lista (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lista contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista


% --- Executes during object creation, after setting all properties.
function lista_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global posx posy vPosx vPosy Index Distancia;
valor = get(handles.lista,'Value');
list_incr = [0.5 0.1 0.05 0.02 0.01];
incremento = list_incr(valor);
posx = posx + incremento;
if(posx > 1)
    posx = 1;
end

posy = posx^2;
Index = length(vPosx);
vPosx(Index+1) = posx;
vPosy(Index+1) = posy;
Distancia = Distancia + ((posx - vPosx(Index))^2 + (posy - vPosy(Index))^2)^(1/2);
set(handles.tx,'String',num2str(posx));
set(handles.ty,'String',num2str(posy));
set(handles.tDistancia,'String',num2str(Distancia));



x=linspace(0,1,20);
y=x.^2;
plot(x,y);
hold on;
plot(vPosx,vPosy,'r-');
plot([posx],[posy],'-mo','MarkerFaceColor',[0 0 0]);
hold off;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global posx posy vPosx vPosy Index Distancia;
posx=0;
posy=0;
Distancia = 0;

set(handles.tx,'String',num2str(posx));
set(handles.ty,'String',num2str(posy));
set(handles.tDistancia,'String',num2str(Distancia));
vPosx=[ 0 ];
vPosy=[ 0 ];
Index = 1;

x=linspace(0,1,20);
y=x.^2;
plot(x,y);
hold on;
plot(vPosx,vPosy);
hold off;
hold on;
plot([posx],[posy],'-mo','MarkerFaceColor',[0 0 0]);
hold off;
