function [result,count] = FetchFromAPI( artist,count,fLog )

mbURL = 'http://musicbrainz.org/ws/2/artist/?query=alias:"#{artist}"&fmt=json';
lfmURL='http://ws.audioscrobbler.com/2.0/?method=artist.getcorrection&artist=#{artist}&api_key=410d7df25a7a236805707752cd40a3d2&format=json'; 
options = weboptions('Timeout',10);

try
  url = strrep(mbURL,'#{artist}',urlencode(artist));
  api_result = webread(url,options);
  if api_result.count==1
      result=api_result.artists.id;
  else 
      url = strrep(lfmURL,'#{artist}',urlencode(artist));
      api_result=webread(url,options);
      result =api_result.corrections.correction.artist.mbid;
  end
    
catch ME
    errMsg=strcat('Error processing artist : ',artist)
    warning(errMsg);
    fprintf('%s\n',errMsg);
    count=count+1;
    result='';
end

end

