Float calulateAngle(float powerPastPos, PVector pos, int orientation)
  {
    PVector nextPos = predictPrevioustLocation(powerPastPos);

    if (orientation == 1)
    { //X rotation
      float adjacant = nextPos.x - pos.x;
      float oppose = nextPos.z - pos.z;

      float phi = atan2(oppose, adjacant); 
      return phi;
    }
    else if (orientation == 2)
    {//Y rotation
      float adjacant = nextPos.x - pos.x;
      float oppose = nextPos.y - pos.y;
      float phi = atan2(oppose, adjacant); 
      return phi;
    }
    else if (orientation == 3)
    {//z Rotation
      float adjacant = nextPos.y - pos.y;
      float oppose = nextPos.z - pos.z;
      float phi = atan2(oppose, adjacant); 
      return phi;
    }
    else
    {
      return null;
    }
  }

