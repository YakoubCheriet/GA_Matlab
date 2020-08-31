function varargout = Menu(varargin)
% MENU MATLAB code for Menu.fig
%      MENU, by itself, creates a new MENU or raises the existing
%      singleton*.
%
%      H = MENU returns the handle to a new MENU or the handle to
%      the existing singleton*.
%
%      MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU.M with the given input arguments.
%
%      MENU('Property','Value',...) creates a new MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Menu

% Last Modified by GUIDE v2.5 03-Nov-2018 17:24:50

% Begin initialization code - DO NOT EDIT
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


% --- Executes just before Menu is made visible.
function Menu_OpeningFcn(hObject, eventdata, handles, varargin)
evalin( 'base', 'clearvars *' );clc;
% Choose default command line output for Menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Menu_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function editNbObjet_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editNbObjet_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPoids1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editPoids1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editPoids2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editPoids2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editProfit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editProfit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editProfit2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editProfit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editCroiss_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editCroiss_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editMut_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editMut_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonSet.
function pushbuttonSet_Callback(hObject, eventdata, handles)

global Prob_Croiss Prob_Mut Pop_Size Gen_Nbr Exec_Time Objet_Nbr Poids Profit

Prob_Croiss = str2double(get(handles.editCroiss,'String'));
Prob_Mut = str2double(get(handles.editMut,'String'));
Pop_Size = str2double(get(handles.editPop_Size,'String'));
Gen_Nbr = str2double(get(handles.editIteration,'String'));
Exec_Time = str2double(get(handles.editExc_Time,'String'));
Objet_Nbr = str2double(get(handles.editNbObjet,'String'));
Poids = [str2double(get(handles.editPoids1,'String'));str2double(get(handles.editPoids2,'String'))];
Profit = [str2double(get(handles.editProfit1,'String'));str2double(get(handles.editProfit2,'String'))];

% --- Executes on button press in pushbuttonStart.
function pushbuttonStart_Callback(hObject, eventdata, handles)
global Gen_Nbr Exec_Time

if strcmp(handles.editIteration.Enable,'off')
    Gen_Nbr = -1;
elseif strcmp(handles.editExc_Time.Enable,'off')
    Exec_Time = -1;
end
    
Algorithme_Genetique
% --- Executes on selection change in popupmenuCritere.
function popupmenuCritere_Callback(hObject, eventdata, handles)

contents = get(handles.popupmenuCritere,'String');
Value = contents{get(handles.popupmenuCritere,'Value')};


if strcmp(Value,'Iteration(Generation)') == 1
    set(handles.editIteration,'Enable','on');
    set(handles.editExc_Time,'Enable','off');
elseif strcmp(Value,'Temps d execution') == 1
    set(handles.editIteration,'Enable','off');
    set(handles.editExc_Time,'Enable','on');
elseif strcmp(Value,'Iteration(Generation) et Temps d execution') == 1
    set(handles.editIteration,'Enable','on');
    set(handles.editExc_Time,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function popupmenuCritere_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editIteration_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editIteration_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editExc_Time_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editExc_Time_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPop_Size_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editPop_Size_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
