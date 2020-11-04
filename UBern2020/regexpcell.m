#Copyright (c) 2009, Maximilien Chaumon
#All rights reserved.

#Redistribution and use in source and binary forms, with or without 
#modification, are permitted provided that the following conditions are 
#met:

 #   * Redistributions of source code must retain the above copyright 
  #    notice, this list of conditions and the following disclaimer.
   # * Redistributions in binary form must reproduce the above copyright 
    #  notice, this list of conditions and the following disclaimer in 
      #the documentation and/or other materials provided with the distribution
      
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
#AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
#IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
#ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
#LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
#CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
#SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
#INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
#CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
#ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
#POSSIBILITY OF SUCH DAMAGE.

function idx = regexpcell(c,pat,inv)

# idx = regexpcell(c,pat,inv)
#
# Return indices idx of cells in c that match pattern(s) pat (regular expression).
# return indexes that do not match the pattern if inv is true (optional).
# Pattern pat can be char or cellstr, in which case regexpcell returns
# indexes of cells that match any pattern in pat.
# 
# v1 Maximilien Chaumon 01/05/09

#error(nargchk(2,3,nargin))
#pause
if not(iscellstr(c))
    error('input c must be a cell array of strings');
end

if ischar(pat)
    pat = cellstr(pat);
end

idx = [];
for i_pat = 1:length(pat)
    trouv = regexp(c,pat{i_pat}); # apply regexp on each pattern
    for i = 1:numel(trouv);
        if not(isempty(trouv{i}))# if there is a match, store index
            idx(end+1) = i;
        end
    end
end
if exist('inv','var') && inv # if we want to invert result, then do so.
    others = 1:numel(trouv);
    others(idx) = [];
    idx = others;
end
