---

layout: default
title: Corpus
permalink: /corpus/
---

Visit this site's [Github page](https://github.com/HornerHolly/dissertation/tree/main/Corpus) to access my cleaned digital editions. This project works with the following digital editions:

**Chapter 1:**
    William Wordsworth. *The Poetical Works of William Wordsworth*, ed. by William Angus Knight, 8 vols, (London: Macmillan and Co., 1896; Gutenberg Press 2003). http://www.gutenberg.org/ebooks/10219. 

**Chapter 2:**
    George Gordon Byron, *Childe Harold’s Pilgrimage* (Project Gutenberg, 2004), II. 646. https://www.gutenberg.org/files/5131/5131-h/5131-h.htm. 

**Chapter 3:**
    Charlotte Smith, *Elegiac Sonnets: And Other Poems, vol 1,* (London: T. Cadell, Junior, and W. Davies, 1797).
    Charlotte Smith, *Elegiac Sonnets: And Other Poems, vol 2, *(London: T. Cadell, Junior, and W. Davies, 1797).
    Charlotte Smith, *Beachy Head: With Other Poems,* (London: J. Johnson, 1807).
    Charlotte Smith. *The Emigrants: A Poem, in Two Books*, (London: T. Cadell, 1793). 

# Metadata Dictionary
The metadata table uses the following fields of categorization:

    - Sonnet Number (N/A is used when the provided poem is not classified as a sonnet)
    - Poem Title ( my modifications to poem titles are identified with [brackets])
    - Collection Title
    - Author Name
    - Publication Year
    - Edition
    - Page Location for individual poem
    - Total Pages in Volume
    - Location Found

# File Name
The file names for the individual plaintext versions of the poems are identified by volume abbreviation, page number, and shortened poem title. For example, "To Spring" from Elegiac Sonnets and Other Poems, Vol I is idenified as:

    - ESVI_8_tospring
    
# Metadata  Files for Poets
<ul>
{% for corpusmetadata in site.corpusmetadata %}
<li>
<a href="{{site.baseurl}}/{{corpusmetadata.permalink}}">
{{corpusmetadata.title}} 
</a>
</li>
{% endfor %}
</ul>
