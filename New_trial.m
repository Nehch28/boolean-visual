function varargout = New_trial(varargin)
% NEW_TRIAL MATLAB code for New_trial.fig
%      NEW_TRIAL, by itself, creates a new NEW_TRIAL or raises the existing
%      singleton*.
%
%      H = NEW_TRIAL returns the handle to a new NEW_TRIAL or the handle to
%      the existing singleton*.
%
%      NEW_TRIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_TRIAL.M with the given input arguments.
%
%      NEW_TRIAL('Property','Value',...) creates a new NEW_TRIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before New_trial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to New_trial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help New_trial

% Last Modified by GUIDE v2.5 12-Feb-2020 16:57:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @New_trial_OpeningFcn, ...
                   'gui_OutputFcn',  @New_trial_OutputFcn, ...
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


% --- Executes just before New_trial is made visible.
function New_trial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to New_trial (see VARARGIN)

% Choose default command line output for New_trial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes New_trial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = New_trial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Variables define
global yes;
yes = 0;
global subject;
subject  = inputdlg({'Enter name of subject: '});

global block;
block = 1;

global trial_no;
trial_no = 1;

global total_trials;
total_trials = 1;

set (handles.check, 'BackgroundColor' , 'w');
set (handles.display_box,'String','First Trial');

%% Call_Next : Begin Execution of experiment
display_box_CreateFcn(hObject, eventdata, handles)
next_Callback(hObject, eventdata, handles);


% --- Executes on button press in next.


function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Variables Define

% Total blocks = 20
% Training = 5, test = 15
global block;

% the time each puzzle is shown for
% differs for trial(2/3.25/5.75 sec) and training(10 sec).
global trial_time;

% the time between each trials
global inter_trial_time;

% trial_number = number of trials one block shows. this differs for
% test(19) and training(18) trials.
global trial_number;

% the structure formed everytime a block is executed
global Output;

% trial_no = the try number the subject is currently on. it changes
% even on a failed trial for each block. It changes after every block ends.
global trial_no;

% The number used to access matrix inventory, stores the total number of
% trials. Changes per iteration for every block. For example range would be
% >=285.
global total_trials;



%% Local Variables define

b_name = "" + block + "T" + trial_no;


fig1 = demo_keyboard("Block " + block);
set (groot, 'CurrentFigure' , fig1);
axis off;
answers = [];
set(handles.block,'String',"Block number" + block);
trial_time = 5;
inter_trial_time = [0.5;0.6;0.7;0.8;0.9;1.0;1.1;1.2;1.3;1.4;1.5];
TI = load('time_index.mat');

%% Block Specifications

if block<=5
    trial_number = 3;
    %trail runs
for trial=1:trial_number
    flag_trial = false;
    axis off;
    if ishandle(fig1)
    
    %Plotting
    set(fig1,'Name',"Trial " + trial)
    main_circle();
    [plot_matrix,plot_answer,m_code] = get_matrix_uniform(total_trials);
    plot_circle(plot_matrix);
    middle_circle_keyboard();
    %
    
    % Saving the information
    handles = guidata (hObject);
    handles.CNF(:,:,trial) = plot_matrix;
    handles.correct_answers(:,:,trial) = plot_answer;
    handles.m_code(:,trial) = m_code;
    handles.time(:,trial) = trial_time;
    guidata(hObject,handles);
    answers = cat(1,answers,getGlobalanswer);
    
    
    %
    setGlobalanswer([2 2 2]);
    pause(trial_time);
    cla;
    pause(inter_trial_time(TI.index_time(trial,:)));
    total_trials = total_trials +1;
  
    end
    

end
    

else 
    %test runs
    trial_number = 3;
for trial=1:trial_number
    flag_trial = true;
    if ishandle(fig1)
    
    %Plotting
    set(fig1,'Name',"Trial " + trial)
    main_circle();
    [plot_matrix,plot_answer,m_code] = get_matrix_uniform(total_trials);
    plot_circle(plot_matrix);
    middle_circle_keyboard();
    %
    
    % Saving the information
    handles = guidata (hObject);
    handles.CNF(:,:,trial) = plot_matrix;
    handles.correct_answers(:,:,trial) = plot_answer;
    handles.m_code(:,trial) = m_code;
    guidata(hObject,handles);
    answers = cat(1,answers,getGlobalanswer);
    
    %
    setGlobalanswer([2 2 2]);
    %inter_trial_time_indices = cat(1,inter_trial_time_indices,inter_trial_time(TI(trial,:)));
    %{
    test_trial = [4,5.25,6.75];
    test_time = randperm(3,1);
    %}
    test_trial = [4,5,6];
    test_time = randperm(3,1);
    handles = guidata (hObject);
    handles.time(:,trial) = test_trial(test_time);
    guidata(hObject,handles);
    pause(test_trial(test_time));
    cla;
    pause(inter_trial_time(TI.index_time(trial,:)));
    total_trials = total_trials +1;
  
    end
    

end
    

end

%% Saving the information

answers = cat(1,answers,getGlobalanswer);
handles = guidata(hObject);
handles.answer = answers;
%handles.times =  inter_trial_time_indices;
guidata(hObject,handles);
%

%% Preparing output

Output.Trials = trial_number;
Output.CNF_matrix = handles.CNF;
Output.answers = handles.answer(2:length(answers(:,1)),:);
Output.time_indices = handles.time;
B = handles.correct_answers;
Output.correct_answers = permute (B, [3 2 1]);
Output.m_code = handles.m_code;
%


%% Checking validity of block
count = 0;
correct_trials = zeros(trial_number,1);
if (length(Output.answers(:,1))==trial_number)
for i=1:trial_number
    if(Output.answers(i,:)== Output.correct_answers(i,:))
        count = count+1;
        correct_trials(i,:) = 1;
    end
end

Output.no_correct = count;
Output.correct_trials = correct_trials;

    
if(count>=round((55/100)*trial_number))
set(handles.display_box,'String','Click Next');
Output.validity = true;


else
    
    Output.validity = false;
    
end


if(flag_trial&&count>=round((55/100)*trial_number))
set (handles.check, 'BackgroundColor' , 'green');
set (handles.display_box,'String','Click Next');
block = block+1;
end

if(flag_trial&&count<round((55/100)*trial_number))
    set (handles.check, 'BackgroundColor' , 'red');
    set (handles.display_box,'String','Repeat Block')

end

if(~flag_trial)
block = block+1;
    set (handles.check, 'BackgroundColor' , 'white');
    set (handles.display_box,'String','Click Next');
end
    

else
    set (handles.check, 'BackgroundColor' , 'red');
    set (handles.display_box,'String','Repeat Block');
    assignin('base',"B" + block,Output);
    Output.validity = false;
    
    
end

%% Creating workspace variables
assignin('base',"B" + b_name,Output);
handles = guidata(hObject);
handles.no_correct = count;
handles.validity =  Output.validity;
handles.Trials = trial_number;
guidata(hObject,handles);
%

if ishandle(fig1)
    close(fig1);
end
trial_no = trial_no + 1;
clearvars -global Output;


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clearvars;
closereq;



function display_box_Callback(hObject, eventdata, handles)
% hObject    handle to display_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_box as text
%        str2double(get(hObject,'String')) returns contents of display_box as a double
global block;
set(handles.display_box,'String',"Repeat block" + block);

% --- Executes during object creation, after setting all properties.
function display_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function d = demo_keyboard(v)
d = figure('Name',v,'color','w','NumberTitle','off');
set (gcf, 'MenuBar' , 'None' ,'KeyPressFcn',@my_key);
function my_key(~,eventdata)
global c1;
global c2;
global c3;
global yes;

   switch eventdata.Key
    case '1'
        colorc1(c1);
    case '2'
        colorc2(c2);
    case '3'
        colorc3(c3);
   end
   
co1 = c1.FaceColor;
co2 = c2.FaceColor;
co3 = c3.FaceColor;

color = cat(1,co1,co2,co3)
answer = solutionmake(color)
setGlobalanswer(answer);


function colorc1(rect)
if(rect.FaceColor == [0 0 0])
    rect.FaceColor = 'W';
   
else
    rect.FaceColor = 'K';
    
end
setGlobalcolor3(rect.FaceColor);


function colorc2(rect)
if(rect.FaceColor == [0 0 0])
    rect.FaceColor = 'W';
   
else
    rect.FaceColor = 'K';
    
end
setGlobalcolor3(rect.FaceColor);


function colorc3(rect)
if(rect.FaceColor == [0 0 0])
    rect.FaceColor = 'W';
   
else
    rect.FaceColor = 'K';
    
end
setGlobalcolor3(rect.FaceColor);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H = New_trial;
set (H, 'Color' , 'white');
global subject;
global block;

if block<=5
name = 'training.mat';
FileName = strcat(subject{1},name);
evalin('base', ['save(''', FileName ''')']);

else
    name = 'test.mat';
    FileName = strcat(subject{1},name);
    evalin('base', ['save(''', FileName ''')']);
    
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
block_no = inputdlg({'Enter block number: '});
global block;
block = str2double(block_no{1});

global subject;
subject  = inputdlg({'Enter name of subject: '});

global trial_no;
trial_no = inputdlg({'Enter trial number: '});
trial_no = str2double(trial_no{1});

global total_trials;
total_trials = 1;

set (handles.check, 'BackgroundColor' , 'w');
set (handles.display_box,'String','First Trial');

%% Call_Next : Begin Execution of experiment
display_box_CreateFcn(hObject, eventdata, handles)
next_Callback(hObject, eventdata, handles);
