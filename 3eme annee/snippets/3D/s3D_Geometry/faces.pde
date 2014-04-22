class face
{
  ArrayList<pointCoord> pts;
  int ptsArraySize;
  int indexA, indexB, indexC, indexD;

  face(PVector a, PVector b, PVector c, PVector d, int indexA_, int indexB_, int indexC_, int indexD_) {
    indexA = indexA_;
    indexB = indexB_;
    indexC = indexC_;
    indexD = indexD_;
    
    pts = new ArrayList<pointCoord>();
    pts.add(new pointCoord(a, indexA));
    pts.add(new pointCoord(b, indexB));
    pts.add(new pointCoord(c, indexC));
    pts.add(new pointCoord(d, indexD));
  }
}

