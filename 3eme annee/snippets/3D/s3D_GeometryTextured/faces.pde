class face
{
  ArrayList<pointCoord> pts;
  int ptsArraySize;
  int indexA, indexB, indexC, indexD;

  face(PVector a, PVector b, PVector c, PVector d, int indexA_, int indexB_, int indexC_, int indexD_,PVector indexTex1_, PVector indexTex2_,PVector indexTex3_, PVector indexTex4_) {
    indexA = indexA_;
    indexB = indexB_;
    indexC = indexC_;
    indexD = indexD_;
    
    pts = new ArrayList<pointCoord>();
    pts.add(new pointCoord(a, indexA, indexTex1_));
    pts.add(new pointCoord(b, indexB, indexTex2_));
    pts.add(new pointCoord(c, indexC, indexTex3_));
    pts.add(new pointCoord(d, indexD, indexTex4_));
  }
}

