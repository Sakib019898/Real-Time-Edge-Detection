function varargout = DynamicSE(varargin)
% DYNAMICSE MATLAB code for DynamicSE.fig
%      DYNAMICSE, by itself, creates a new DYNAMICSE or raises the existing
%      singleton*.
%
%      H = DYNAMICSE returns the handle to a new DYNAMICSE or the handle to
%      the existing singleton*.
%
%      DYNAMICSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DYNAMICSE.M with the given input arguments.
%
%      DYNAMICSE('Property','Value',...) creates a new DYNAMICSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DynamicSE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DynamicSE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DynamicSE

% Last Modified by GUIDE v2.5 11-Apr-2019 06:12:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DynamicSE_OpeningFcn, ...
                   'gui_OutputFcn',  @DynamicSE_OutputFcn, ...
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


% --- Executes just before DynamicSE is made visible.
function DynamicSE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DynamicSE (see VARARGIN)

% Choose default command line output for DynamicSE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DynamicSE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DynamicSE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Mean.
function Mean_Callback(hObject, eventdata, handles)
% hObject    handle to Mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);

for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectMean(img_gray);
    
    axes(handles.axes5);
    imshow(img4);
    title(handles.axes5,'Mean');
    imshow(img4);
    
    pause(0.1);
end


% --- Executes on button press in Sum.
function Sum_Callback(hObject, eventdata, handles)
% hObject    handle to Sum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);

for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectSum(img_gray);
    
    axes(handles.axes5);
    imshow(img4);
    title(handles.axes5,'Sum');
    
    pause(0.1);
end


% --- Executes on button press in Max.
function Max_Callback(hObject, eventdata, handles)
% hObject    handle to Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);

for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectMax(img_gray);
    
    axes(handles.axes5);
    imshow(img4);
    title(handles.axes5,'Max');
    
    pause(0.1);
end


% --- Executes on button press in compare.
function compare_Callback(hObject, eventdata, handles)
% hObject    handle to compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectMean(img_gray);
    axes(handles.axes4);
    imshow(img4);
    title(handles.axes4,'Mean');
    img5= edgeDetectSum(img_gray);
    axes(handles.axes5);
    imshow(img5);
    title(handles.axes5,'Sum');
    img6= edgeDetectMax(img_gray);
    axes(handles.axes6);
    imshow(img6);
    title(handles.axes6,'Max');
    
    pause(0.1);
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
