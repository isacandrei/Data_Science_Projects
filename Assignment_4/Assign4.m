%files
fileIn = fopen('usersha1-artmbid-artname-plays.tsv');
fileOut = fopen('user-artmbid-artname-plays-cleaned.tsv','w');
fileLog = fopen('log.txt','w');
%formats
formatSpec = '%s %s %s %d';
outFormat = '%s\t%s\t%s\t%d\n';
%number of lines 
n=100; 
%unsuccessfull fetches
count =0 ; 
while ~feof(fileIn)
    try
     C= textscan(fileIn,formatSpec,n,'Delimiter','\t');
     [c1, c2, c3, c4]=C{1,:};
      for i=1:length(c1)
          userId=c1{i,1};
          artistId=c2{i,1};
          artistName=c3{i,1};
          artistPlays=c4(i,1);     
          
          if isempty(artistId)
            [artistId,count]= FetchFromAPI(artistName,count,fileLog);
          end;
          
          fprintf(outFormat,userId,artistId,artistName,artistPlays);
          
      end;
          
    catch ME
      fclose(fileIn);
      fclose(fileOut);
      rethrow(ME);
    end
end