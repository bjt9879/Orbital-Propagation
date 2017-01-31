%%
% This routine will read the TLE data base and write it in a file
%
%
%
%-----------------------------------------------------------------
%%




%% Set up

whichconst = 72;
rad = 180.0 / pi;

% Epoch

%startedit='03-Apr-2016 00:00:00'; % UTC start time  01-Feb-2016 02:25:03
%stopedit ='03-Aug-2016 00:00:00'; % UTC stop time  01-Feb-2016 02:25:03
%s1= 15; %step resolution (min)


%% Loading Files both input & output

inpath='\ExampleInput\Full_Catalog.tle';
infilename = inpath;
infile = fopen(infilename, 'r');
if (infile == -1)
    fprintf(1,'Failed to open file: %s\n', infilename);
    return;
end


% output file for RV Distance Date etc
outpath = 'sat_names_output.txt';
outfilename = outpath;
outfile = fopen(outfilename, 'wt+');
if (outfile == -1)
    fprintf(1,'Failed to open file: %s\n', outfilename);
    return;
end

%% Load TLE from file

opsmode= 'a';
typerun = 'm';

%typeinput = 'e'; %     typeinput = input('input mfe, epoch (YMDHMS), or dayofyr approach, m,e,d:','s');

%%

while (feof(infile) == 0)
longstr1 = fgets(infile, 130);
while ( (longstr1(1) == '#') && (feof(infile) == 0) )
    longstr1 = fgets(infile, 130);
end
longstr2 = fgets(infile, 130);
catno = strtrim(longstr1(3:7)); % Satelite Number

fprintf(outfile,'%5s\n',catno);
end

fclose('all');
%                // convert the char string to sgp4 elements
%                // includes initialization of sgp4