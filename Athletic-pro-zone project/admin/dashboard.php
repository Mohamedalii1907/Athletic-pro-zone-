<?php

	ob_start(); 

	session_start();

	if (isset($_SESSION['Username'])) {

		$pageTitle = 'Dashboard';

		include 'init.php';


		$numUsers = 6; 

		$latestUsers = getLatest("*", "users", "UserID", $numUsers); 

		$numItems = 6; 

		$latestItems = getLatest("*", 'items', 'Item_ID', $numItems); 

		$numComments = 4;

		?>

<div class="home-stats">
	<div class="container text-center">
		<h1>Dashboard</h1>
		<div class="row">
			<div class="col-md-3">
				<div class="stat st-members">
					<i class="fa fa-users"></i>
					<div class="info">
						Total Members
						<span>
							<a href="members.php">
								<?php echo countItems('UserID', 'users') ?>
							</a>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stat st-pending">
					<i class="fa fa-user-plus"></i>
					<div class="info">
						Pending Members
						<span>
							<a href="members.php?do=Manage&page=Pending">
								<?php echo checkItem("RegStatus", "users", 0) ?>
							</a>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stat st-items">
					<i class="fa fa-tag"></i>
					<div class="info">
						Total Items
						<span>
							<a href="items.php">
								<?php echo countItems('Item_ID', 'items') ?>
							</a>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stat st-comments">
					<i class="fa fa-comments"></i>
					<div class="info">
						Total Comments
						<span>
							<a href="comments.php">
								<?php echo countItems('c_id', 'comments') ?>
							</a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<?php


		include $tpl . 'footer.php';

	} 
	
	else {

		header('Location: index.php');

		exit();
	}

	ob_end_flush(); 

?>