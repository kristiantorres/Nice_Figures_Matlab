function write_binary(name,modelo)
    fileID=fopen(name,'w');
    fwrite(fileID,modelo,'single');
    fclose(fileID);
end
