**Free
// -------------------------------------------------------------------------------------------------
//
// Mod�le simple de l'�dition d'un listing de clients
//
// -------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------- Options de contr�les
Ctl-opt Option(*Nodebugio);

// ----------------------------------------------------------------------- D�clarations des fichiers
Dcl-f Customers Disk Usage(*Input);
Dcl-f Custlist Printer Usage(*Output) Oflind(Findepage);

// ---------------------------------------------------------------------- D�clarations des variables
Dcl-s Findepage Ind Inz(*On);

// ---------------------------------------------------------------------------- Proc�dure principale
Read Customers;

Dow Not %Eof(Customers);

  If Findepage;
    Write Entete;                      // Entete est un des formats du fichier Custlist
    Findepage = *Off;
  ENDIF;

  Count += 1;                          // Count est une variable d�finit dans le fichier Custlist
  Write Detail;                        // Detail est un des formats du fichier Custlist
  Read Customers;

ENDDO;

If Findepage;
  Write Entete;
ENDIF;
                                       // Total est un des formats du fichier Custlist
Write Total;

*Inlr = *on;
Return;

