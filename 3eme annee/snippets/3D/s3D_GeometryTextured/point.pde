class pointCoord
{
  PVector location;
  int index;
  PVector indexTex;
  
  pointCoord(PVector location_, int index_, PVector indexTex_)
  {
    location = location_.get();
    index = index_;
    indexTex = indexTex_;
  }
}
