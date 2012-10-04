for mp3file in *.mp3; do \

  # extract wave file from mp3s
  mpg123 -w "${mp3file}.wav" "${mp3file}"; \
  
  # make fade in and out on extracted wave file
  sox "${mp3file}.wav" "preview-${mp3file}.wav" trim 120 120 fade t 5 120 5; \
  
  # delete extracted wave file
  rm "${mp3file}.wav"; \
  
  # encode preview mp3 file in 192kbit/s format
  lame --preset cbr 192 "preview-${mp3file}.wav" "preview-${mp3file}"; \

  # copy id3 tags from orginal mp3 file to preview files
  id3cp ${mp3file} "preview-${mp3file}"; \

  # delete extracted wave and faded file
  rm -v "preview-${mp3file}.wav"; \
done
