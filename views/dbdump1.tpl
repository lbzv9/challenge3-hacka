% for j in range(1, 3):
%   print cursor[j]
%   url = cursor[j]['url']
%   name = cursor[j]['name']
%   idToCheck = cursor[j]['idToCheck']

%   if 'price' in cursor[j]:
%      print "if 'price' in cursor[j]"
%      price = cursor[j]['price']
%      print price
<tr>
	<form action="/delselected" method = "post">
	<td>{{name}}</td>
	<td>{{url}}</td>
	<td>{{idToCheck}}</td>
	<td>{{price}}</td>
	<td><input type="submit" value="Delete" class="btn btn-warning"></td>
	<input type="hidden" value={{url}} name="url">
	</form>
</tr>

%   else:
<tr>
	<form action="/delselected" method = "post">
	<td>{{name}}</td>
	<td>{{url}}</td>
	<td>{{idToCheck}}</td>
	<td></td>
	<td><input type="submit" value="Delete" class="btn btn-warning"></td>
	<input type="hidden" value={{url}} name="url">
	</form>
</tr>

% end
% rebase displayall totinf=totinf
