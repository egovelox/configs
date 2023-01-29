# This lines are meant to conceal 'jdt://' links in Pmenu popups 
# of the jdtls hover functionnality
syn clear markdownLink
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl,mkJdtLink keepend contained
syntax match mkJdtLink /jdt:\/\/.*/ containedin=markdownLink conceal
