
		
	
		



var cartController = function($scope){
	var xhr = new XMLHttpRequest();
	xhr.open('get', '/index/index/cartinfo', false);
	xhr.send();
	data = xhr.onreadystatechange = function ()
	{
		if (xhr.readyState == 4 && xhr.status == 200) {
			return success(xhr.responseText);
		}
	}

	function success(data)
	{
		obj = JSON.parse(data);
		return obj;
	}

	$scope.cart = data();
	// console.log($scope.cart);
	

	//总购买数量
	$scope.totalQuantity = function(){
		var total = 0;
		angular.forEach($scope.cart,function(item){
			total += parseInt(item.quantity);
		});
		return total;
	};
	//总购买价格
	$scope.totalPrice = function(){
		var total = 0;
		
		angular.forEach($scope.cart,function(item){
			total += parseFloat(item.quantity*item.price);
		});
		return total;
	};
	//找一个项目
	$scope.findItem = function(id){
		var index = -1;
		angular.forEach($scope.cart, function(item, key){
			if(item.id === id){
				index = key;
				return;
			};
		});
		return index;
	};
	//移除table
	$scope.remove = function(id){
		var index = $scope.findItem(id);
		var xhr = new XMLHttpRequest();
		xhr.open('post', '/index/index/cart_delete', false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send('oid=' + id);
		if(index !== -1){
			$scope.cart.splice(index,1);	
		};
	};
	//减少一个商品数量
	$scope.reduce = function(id){
		var index = $scope.findItem(id);
		var xhr = new XMLHttpRequest();
		xhr.open('post', '/index/index/cart_sub', false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send('oid=' + id);
		if(index !== -1){
			var item = $scope.cart[index]
			if(item.quantity>1){
				--item.quantity;
			} else{
				var returnKey = confirm("是否从购物车中删除该产品！");
				if(returnKey){
					$scope.remove(id);
					xhr.open('post', '/index/index/cart_delete', false);
					xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					xhr.send('oid=' + id);
				}
			}	
		}
	};
	//增加一个商品数量
	$scope.add = function(id){
		var index = $scope.findItem(id);
		xhr.open('post', '/index/index/cart_add', false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send('oid=' + id);
		if(index !== -1){
			++$scope.cart[index].quantity;	
		};	
	};
}