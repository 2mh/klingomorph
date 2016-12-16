Hafner/Marques in May/June 2011 (Update: 2016)

# Info

Our Klingon morphology, tested with Foma -- version 0.9.14alpha -- can be used 
to generate and analyze Klingon verbs and nouns. As the Klingon language is an 
almost fully agglutinating language, the implementatiion can be done with
concatenating morphology, i.e. we have affixes which we apply to given stems.
Most of the implementation is done with lexc, which allows us to generate,
respectively to accept words through continuation classes.

In the Klingon language there are three classes of words: 

* nouns
* verbs
* all the rest (according to the official Klingon Dictionary)

Most of the meaning, including syntactic information to build phrases, is 
encoded directly into the nouns or verbs. However, there exist some kind of 
particles without any special meaning, that we aren't able to recognize, 
because we didn't implement these words. Anyhow: those particles, taking 
individually, are without own semantic value.

## Nouns
Nouns can be things able to use language, things that are not able to use language
and body parts. We use flag diacritics to implement this conditionals, what's one
of the seldom uses of XFST techniques we do.
What concerns the nouns we can handle nouns with the five types of suffixes available,
which can, but don't have to be used. A stem without any suffixes is then the
infinitive form of that noun. If the suffixes are used they have to be in a fixed
order. However, it's possible to omit any type of suffixes, if the global order
is preserved. We also concatenate stems to each other, such that we are able
to recognize noun compounds.

## Verbs
Verbs are created by (optionally) attaching prefixes to verb stems and then
(optionally) appending suffixes to them. There's a huge bunch of prefixes
possible, which are used to indicate subject and object involved. So
no special (seperate) pronouns are used normally -- they're incorporated
into the verbs. There's a matrix, which can be found in the klingomorph.lexc
file, showing the allowed combinations. For the suffixes the same applies
as for the nouns. For verbs we have 9 types of suffixes, which don't have to
be used, but when used have a given order. It's again possible to omit any
single type, probably creating words which are not used in ``nature''. Something
special about verbs is that there exist special suffixes called ``rovers'', which
can appear for only once between any of the 9 verb suffixes (so at 8 positions).
When such a rover suffix is used between verb suffix type 2 and 3 it changes the
meaning of verb suffix type 2. The rover suffixes are e. g. used to negate those 
suffixes or to mark empathy. This we implemented using (genuine) Foma/XFST
techniques (klingomorph.foma).

- Some foundations for our work can be found here:
* http://17.stuts.de/procs/clauss.html
* http://www.judion.de/klingon/

# How to use

      $ # This is an example of a session with the exmaple files we provide:
      $ # klingoverbs-up and klingonouns-down
      $ foma -l klingolex.foma # Or use xfst if you wanna belong to the dark side.
      
      ! Example of verbs we can analyze; for given examples this of course also
      ! works for nouns:
      foma[1]: up < klingoverbs-up % Example of verbs we can 
      
      vut
      [PL][3PERS][NONE][VERB]vut
      [PL][3PERS][THEM][VERB]vut
      [VERB]vut
      [SG][3PERS][NONE][VERB]vut
      [SG][3PERS][IT][VERB]vut
      [SG][3PERS][THEM][VERB]vut
      
      jIvut'egh
      [SG][1PERS][NONE][VERB]vut[oneself]
      
      jIvutneSwl'
      [SG][1PERS][NONE][VERB]vut[honorific][oneWhoDoes]
      
      qaleghneS
      [SG][1PERS][YOUSG][VERB]legh[honorific]
      
      ! Example of nouns we can generate; for given examples this of course also
      ! works for verbs:
      foma[1]: down < klingonouns-down 
      
      qoH[NOUN][PL][1PERS]
      qoHmeywIj
      
      SuS[NOUN][BIG][PL][2PERS]
      SuS'a'meylIj
      
      Qagh[NOUN][SMALL][PL][locative]
      QaghHompu'Daq
      
      woQ[NOUN][SG][far][DueTo]
      woQvetlhmo'
