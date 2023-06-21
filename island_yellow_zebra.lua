--The Green Roof Initiative --

--1--

--Declare global variables to store the necessary data--
local greenRoofs = {};
local greenRoofCoordinates = {};

--2--

--Define a function to add a new green roof to the list--
function addGreenRoof(name, location)
  table.insert(greenRoofs, {name = name, location = location});
  table.insert(greenRoofCoordinates, {lat = location.lat, lng = location.lng});
end

--3--

--Define a function to remove a green roof from the list--
function removeGreenRoof(name)
  for i, v in ipairs(greenRoofs) do
    if v.name == name then
      table.remove(greenRoofs, i);
      table.remove(greenRoofCoordinates, i);
      break;
    end
  end
end

--4--

--Define a function to get a list of green roofs--
function getGreenRoofs()
  return greenRoofs;
end

--5--

--Define a function to get the coordinates of a green roof--
function getGreenRoofCoordinates(name)
  for i, v in ipairs(greenRoofs) do
    if v.name == name then
      return greenRoofCoordinates[i];
    end
  end
end

--6--

--Define a function to get all the coordinates of the green roofs--
function getAllGreenRoofCoordinates()
  return greenRoofCoordinates;
end

--7--

--Define a function to calculate the total area of the green roofs--
function calculateTotalGreenRoofArea()
  local totalArea = 0;
  for i, v in ipairs(greenRoofs) do
    totalArea = totalArea + v.location.area;
  end
  return totalArea;
end

--8--

--Define a function to get the total number of green roofs--
function getTotalGreenRoofs()
  return #greenRoofs;
end

--9--

--Define a function to get the names of all the green roofs--
function getGreenRoofNames()
  local names = {};
  for i, v in ipairs(greenRoofs) do
    table.insert(names, v.name);
  end
  return names;
end

--10--

--Define a function to get the locations of all the green roofs--
function getGreenRoofLocations()
  local locations = {};
  for i, v in ipairs(greenRoofs)  do
    table.insert(locations, v.location);
  end
  return locations;
end

--11--

--Define a function to update the location of an existing green roof--
function updateGreenRoofLocation(name, location)
  for i, v in ipairs(greenRoofs) do
    if v.name == name then
      v.location = location;
      greenRoofCoordinates[i].lat = location.lat;
      greenRoofCoordinates[i].lng = location.lng;
    end
  end
end

--12--

--Define a function to generate a report on the green roofs--
function generateGreenRoofReport()
  local report = {};
  report["totalGreenRoofs"] = #greenRoofs;
  report["totalGreenRoofArea"] = calculateTotalGreenRoofArea();
  report["greenRoofNames"] = getGreenRoofNames();
  report["greenRoofCoordinates"] = getAllGreenRoofCoordinates();
  return report;
end

--13--

--Define a function to save the green roof data to a file--
function saveGreenRoofData(filename)
  local file = io.open(filename, "w");
  for i, v in ipairs(greenRoofs) do
    file:write(v.name .. "," .. v.location.lat .. "," .. v.location.lng .. "," .. v.location.area .. "\n");
  end
  file:close();
end

--14--

--Define a function to load the green roof data from a file--
function loadGreenRoofData(filename)
  local file = io.open(filename, "r");
  if not file then return nil; end
  local data = file:read("*all");
  file:close();

  local lines = split(data, "\n");
  for i, line in ipairs(lines) do
    local fields = split(line, ",");
    if #fields == 4 then
      local name = fields[1];
      local lat = tonumber(fields[2]);
      local lng = tonumber(fields[3]);
      local area = tonumber(fields[4]);
      addGreenRoof(name, {
        lat = lat,
        lng = lng,
        area = area
      });
    end
  end
end

--15--

--Define a util function to split a string--
function split(s, delimiter)
  local result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match);
  end
  return result;
end